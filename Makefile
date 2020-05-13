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

# This target exists only to get all the Docker images required created.
.PHONY: images
images: managed-node-image control-node-image

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

#-----------------------------------------------------------------
# These 'run' targets are temporary, and will be replaced by
# docker-compose running them.
#-----------------------------------------------------------------
.PHONY: managed-node-run
managed-node-run: managed-node-image
	cd docker/machines/managednode; \
	docker run \
		-d \
		--rm \
		-p 4848:22 \
		--name=managednode \
		managednode


.PHONY: control-node-run
control-node-run: control-node-image
	cd docker/machines/controlnode; \
	docker run \
		--rm \
		--name=controlnode \
		controlnode






