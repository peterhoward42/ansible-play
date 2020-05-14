# This Makefile uses docker-compose to create and bring up an
# infrastructure containing one Ansible control node, and 3
# Andible managed nodes.


# <infrastructure-up> is the entry point target.
# Create and bring up the entire fleet infrastruture.
.PHONY: infrastructure-up
infrastructure-up: images
	cd ./docker; \
	docker-compose up -d --scale managednode=3

# Bring the infrastructure down.
.PHONY: infrastructure-down
infrastructure-down:
	cd docker; \
	docker-compose down

# Create the Docker images required.
.PHONY: images
images: /tmp/rsa-key managed-node-image control-node-image

# Make sure there's an RSA key pair set up in /tmp
# (for SSH), so we can load the public one onto the
# managed node(s).
/tmp/rsa-key:
	ssh-keygen -N "" -f /tmp/rsa-key

# Create Docker image for the managed node(s).
.PHONY: managed-node-image
managed-node-image:
	$(eval public_key_text := $(shell cat /tmp/rsa-key.pub))
	cd docker/machines/managednode; \
	docker build \
		-t managednode \
		--rm \
		--build-arg SSH_KEY="$(public_key_text)" \
		.

# Create Docker image for the Ansible control node.
.PHONY: control-node-image
control-node-image:
	cd docker/machines/controlnode; \
	docker build \
		-t controlnode \
		--rm \
		.




