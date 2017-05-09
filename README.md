# README

## Description

A Rails application that queries a time service for the current time, and stores each query result in a sqlite database.  

Landing page contains two text boxes for latitude and longitude, and single button that, when clicked, queries the earthtools.org (http://new.earthtools.org/webservices.htm) web service v1.1 for the local current time. Each time this happens, the session id, lat/long and response is recorded through a model object to the database. After the submit button is clicked the current local time is displayed.

## Known issues

As of 5/8/2017 per the documentation on earthtools.org Daylight Savings Time (DST) in Western Europe is handled correctly, however DST may not be handled correctly in other parts of the world.  For example Chicago, IL USA GPS coordinates of lat: 41.8781 long: -87.6298 returns an incorrect time.  

# Ruby and Rails Versions

Ruby 2.2.1

Rails 4.2.7.1

# Dependencies

## Test Level

rspec-rails, ~> 3.5

capybara

factory_girl_rails

capybara-screenshot


## Project Level

nokogiri, ~> 1.6

simple_form

bootstrap-sass, ~> 3.3.6

sass-rails, >= 3.2

puma

# Getting Started

```
$ git clone https://github.com/rdalin82/LocationClock.git
$ cd LocationClock
$ bundle install
$ rake db:migrate
```


# Running Tests

```
rspec
```

# Starting the application

```
rails server
```
