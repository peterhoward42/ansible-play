MY_SSH_PUBLIC_KEY := $(shell cat ~/.ssh/id_rsa.pub)

.PHONY: managed-node-run
managed-node-run: managed-node-image
	cd machines/managednode; \
	docker run \
		--rm \
		-p 4848:22 \
		--name=managednode \
		managednode

.PHONY: managed-node-image
managed-node-image:
	cd machines/managednode; \
	docker build \
		-t managednode \
		--build-arg SSH_KEY="$(MY_SSH_PUBLIC_KEY)" \
		.
