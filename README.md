![logo](logo.png)

# Tanuki - Simple judge system

Project made as an assignment project for Data Engineering course 2021/22

# Installation

### Prerequisites

- Docker
- make
- docker-compose

### Installation

```
git clone https://github.com/mhorod/tanuki.git
cd tanuki
/bin/bash run-release.sh
```

You can then access the app on http://localhost:3000

# Development

### Prerequisites

- Docker
- docker-compose
- make

## Starting the app

To start app in development mode run `bash run-dev.sh`. It builds the image with
`make` and `docker-compose` and then starts the app.

App runs on port `3000` and postgres runs on port `5433`
