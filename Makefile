IMAGE_NAME = hidori/gocyclo

.PHONY: build
build:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} .

.PHONY: rebuild
rebuild:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} --no-cache .

.PHONY: rmi
rmi:
	docker rmi -f ${IMAGE_NAME}

.PHONY: pull
pull: rmi
	docker pull ${IMAGE_NAME}

.PHONY: run
run:
	docker run --rm -w $$PWD -v $$PWD:$$PWD hidori/gocyclo -top 30 .
