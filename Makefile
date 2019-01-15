CONTAINER_NAME=morosawamikihito/blue-green-app

register.blue: clean build.blue push

register.green: clean build.green push

clean:
	@sbt clean

build.app:
	@sbt assembly

build.blue: build.app 
	docker build -t ${CONTAINER_NAME}:${TAG} . --build-arg SET_COLOR=blue

build.green: build.app
	docker build -t ${CONTAINER_NAME}:${TAG} . --build-arg SET_COLOR=green

push:
	docker push ${CONTAINER_NAME}:${TAG}

help:
	@echo "how to use this Makefile. \n\
	   register:       e.g.) make register.blue TAG=v1-blue \n\
	   build.app:      e.g.) make build.app \n\
	   build.green:    e.g.) make build.green TAG=v1-green \n\
	   push:           e.g.) make push TAG=v1-green"

.PHONY: register.blue register.green clean build.app build.blue build.green push help
.DEFAULT_GOAL := help