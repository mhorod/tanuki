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

# TODO

## Server

- [x] user system
- [ ] permissions
- [ ] redirect to log-in page, then redirect back if user is not logged in

### Problems

- [ ] statement loading
- [ ] most recent status

### Submits

- [x] file upload
- [ ] filetype detection
- [ ] binary files
- [x] submit authorization
- [ ] result loading
- [x] display problem and contest name when submitting
- [ ] verify extension

---

## Database

- [ ] user system
- [ ] results
- [ ] permissions

### Contests

- [ ] contest participants
- [ ] submits for contest for all and single user
- [ ] scoreboard

### Problems

- [ ] view of 'decorated' problems i.e. with contest and status name
- [ ] deadlines and recent statuses
- [x] all problems in a contest
- [x] find problem by id

### Submits

- [ ] allowed extensions
- [ ] results, QUE if there are no found
- [ ] trigger that checks that contest is active

### Results

- [ ] status is obligatory, points are optional
- [ ] problem of task results for given submit has to match the problem of the
      submit

---

## Frontend

- [x] logo
- [x] log in and sign-up
- [ ] navbar
- [ ] admin panel
- [ ] dashboard
- [ ] problem page
- [ ] results page
- [x] syntax highlighting
- [x] contest management
- [ ] scoreboard

- [ ] adding contests
- [ ] editing contests
- [x] adding problems
- [x] editing problems
- [ ] showing student results
- [ ] editing users
- [x] adding users to contest
