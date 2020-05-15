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
images: managed-node-image control-node-image

# Create Docker image for the managed node(s).
.PHONY: managed-node-image
managed-node-image:
	cd docker; \
	docker build -f Dockerfile-managednode \
		-t managednode \
		--rm \
		.

# Create Docker image for the Ansible control node.
.PHONY: control-node-image
control-node-image:
	cd docker; \
	docker build -f Dockerfile-controlnode\
		-t controlnode \
		--rm \
		.




