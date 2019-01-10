build::
	echo "$$DOCKER_PASSWORD" | docker login -u "$$DOCKER_USERNAME" --password-stdin
	cd src/$(DOCKER_IMAGE)
	docker build -t neos-$(DOCKER_IMAGE) .
	docker images
	docker tag neos-elasticsearch $$DOCKER_USERNAME/neos-$(DOCKER_IMAGE)
	docker push $$DOCKER_USERNAME/neos-$(DOCKER_IMAGE)