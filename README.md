# Tanuki - demo project in deno

## Dependencies

- deno
- Docker
- tailwindcss

## Development

1. Run `npm run watch:css` to enable live watch for tailwind
2. To run application in dev mode `bash run-dev.sh` It builds image using
   `docker-compose` which runs deno with `--watch` flag and creates a virtual
   volume in docker that watches changes in directory on drive which enables
   live code reloading without need to rebuild docker image.

App runs on port `3000` and postgres runs on port `5433`
