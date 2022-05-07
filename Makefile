# The purpose of this Makefile is to optimize building the app with docker
# without rebuilding stuff that can be reused
# Make operates on files so we create a dummy file in .build directory for every action
# This way we can execute an action when its dependecies change

SQL = $(shell find app/db -type f)
TS = $(shell find app -type f -name "*.ts")
DOCKER_DEV = $(shell find docker/dev -type f) app/.env docker-compose.dev.yml
DOCKER = $(shell find docker/release -type f) app/.env docker-compose.yml

# Build whole app in release mode
.build/app.release: .build/volumes $(TS) $(DOCKER)
	docker-compose -f docker-compose.yml build
	mkdir -p .build
	touch .build/app.release

# Build whole app in dev mode
.build/app.dev: .build/volumes $(TS) $(DOCKER_DEV)
	docker-compose -f docker-compose.dev.yml build
	mkdir -p .build
	touch .build/app.dev

# Clean volumes to reload cached database config
.build/volumes: $(SQL)
	docker-compose -f docker-compose.dev.yml down --volumes
	mkdir -p .build
	touch .build/volumes

clean:
	rm .build/*
