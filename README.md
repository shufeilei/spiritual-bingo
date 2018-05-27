# README

## Resources that you need
* Server
* Linux OS - Ubuntu is a good choice
* Domain name

## Setup the App

### Setup the RoR Environment
Install ruby package manager: `rbenv`, `rbenv-build`, `rbenv-vars`

Install the latest ruby version: `rbenv install 2.5.1`

Set this ruby version as global: `rbenv global 2.5.1`

Install bundler: `gem install bundler`. We will use bundler to manage gems used by this app.

### Setup web server and database server
Set up `nginx`: `sudo apt install nginx`
* Configure `nginx`

Set up `mysql`: `sudo apt install mariadb`
> You can use `postgres` too if you prefer
* Configure `mysql`

### Setup the App
Clone the application: `git clone https://github.com/shufeilei/iusm.git`

Set environmental variables in `.rbenv-vars`:
```
SECRET_KEY_BASE=justabunchofrandomstringwhichyoucangenerateuysingbinrailssecret
DB_USERNAME=db-user
DB_PASSWORD=db-password
```

Run database migration: `RAILS_ENV=production bin/rails db:migrate`

Generate assets: `RAILS_ENV=production bin/rails assets:precompile`

Start the app: `RAILS_ENV=production bin/pumactl start`
