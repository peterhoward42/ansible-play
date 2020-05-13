MY_SSH_PUBLIC_KEY := $(shell cat ~/.ssh/id_rsa.pub)

# This target is the entry point.
# Being the first target, it is the one run if you just type make on its own.
# It uses docker-compose to create and bring up the entire fleet infrastruture.

.PHONY: infrastructure-up
infrastructure-up: images
	cd ./docker; \
	docker-compose up -d --scale managednode=3

# This target is the counterpart to infrastructure-up, and can be used to bring the
# infrastructure down.

.PHONY: infrastructure-down
infrastructure-down:
	cd docker; \
	docker-compose down

# This target exists only to get all the Docker images required created, and
# to ensure there is an RSA key pair ready to use in image creation.
.PHONY: images
images: /tmp/tmp-rsa-key managed-node-image control-node-image

# This target creates an ephemeral RSA key pair in a temporary
# directory that can be picked up during the subsequent image
# creation step.
/tmp/tmp-rsa-key:
	ssh-keygen -q -N "" -f /tmp/tmp-rsa-key

# This target produces the Docker image for the managed node(s).
.PHONY: managed-node-image
managed-node-image:
	cd docker/machines/managednode; \
	docker build \
		-t managednode \
		--rm \
		--build-arg SSH_KEY="$(MY_SSH_PUBLIC_KEY)" \
		.

# This target produces the Docker image for the Ansible control node.
.PHONY: control-node-image
control-node-image:
	cd docker/machines/controlnode; \
	docker build \
		-t controlnode \
		--rm \
		.






