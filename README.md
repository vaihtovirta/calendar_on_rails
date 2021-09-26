# Calendar On Rails

[![Build Status](https://travis-ci.org/vaihtovirta/calendar_on_rails.svg?branch=master)](https://travis-ci.org/vaihtovirta/calendar_on_rails)

Simple ROR-based calendar with implementation of recurring events and multiple user schedules.
![](https://monosnap.com/file/MTmvNXN4qSzzRjpeNrqodl64LuE4v9.png)

## Built with
* [simple_calendar](https://github.com/excid3/simple_calendar)
* [ice_cube](https://github.com/seejohnrun/ice_cube)
* [devise](https://github.com/plataformatec/devise)

## Test account

[Heroku](https://calendar-onrails.herokuapp.com/)

```
login: user@example.com
password: password
```


## Development

### Run

```sh
$ docker-compose up --build
```

### Test

```sh
$ docker-compose run --rm app_test rails db:test:prepare
$ docker-compose run --rm app_test bundle exec rspec
```

## Caveats
Tested with Google Chrome, may appear incorrectly in other browsers.
