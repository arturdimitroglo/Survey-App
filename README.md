# README

This is a survey app I built with authetication functionality.

This app can be set up on a `linux` distrabution of your choice or on `Mac OSX`, for more information see how to set up a `Rails 7` project with `devise` and `postgresql` 

## Getting started
### Ruby version
  `ruby 2.7.2`

### Rails version
  `Rails 7.0.2.4`


### Database Configuration
  #### 1. Postgresql Version
  `postgres12` 
  
  #### 2. Database roles and password
  Create a role in postgres called `survey_app` with password:`password`

  #### 3.Databse creation
  Run `rails db:create`/ `bin/rails db:create` to cretae  devlopmentt and test databases, then run `rails db:migrate`/`bin/rails db:migrate` to run all migrations

### Installing dependencies
  Run `bundle install` to install all neccesary dependencies 

