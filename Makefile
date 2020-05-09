.PHONY: managednoderun
managednoderun: managednodeimage
	cd machines/managednode; \
	docker run \
		--rm \
		--name=managednode \
		managednode

.PHONY: managednodeimage
managednodeimage:
	cd machines/managednode; \
	docker build \
		-t managednode \
		--build-arg SSH_KEY="fibble" \
		.