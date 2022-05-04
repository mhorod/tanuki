# The purpose of this Makefile is to optimize building the app with docker
# without rebuilding stuff that can be reused
# Make operates on files so we create a dummy file in .build directory for every action
# This way we can execute an action when its dependecies change

SQL = $(shell find app/db -type f)
TS = $(shell find app -type f -name "*.ts")

# Build whole app in dev mode
.build/app.dev: .build/volumes $(TS)
	docker-compose -f docker-compose.dev.yml build
	touch .build/app.dev

# Clean volumes to reload cached database config
.build/volumes: $(SQL)
	docker-compose down --volumes
	touch .build/volumes
