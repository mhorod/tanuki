# Tanuki - demo project in deno

## Dependencies necessary for development

- npm - for tailwindcss
- Docker
- `docker-compose`
- make

## Development

To start app in development mode run `bash ./run-dev.sh`. It builds the image
with `make` and `docker-compose` and then starts the app.

App runs on port `3000` and postgres runs on port `5433`
