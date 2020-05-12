MY_SSH_PUBLIC_KEY := $(shell cat ~/.ssh/id_rsa.pub)

.PHONY: images
images: managed-node-image control-node-image

.PHONY: managed-node-image
managed-node-image:
	cd docker/machines/managednode; \
	docker build \
		-t managednode \
		--rm \
		--build-arg SSH_KEY="$(MY_SSH_PUBLIC_KEY)" \
		.

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

