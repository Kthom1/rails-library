# Rails Library

## What is this?

This is a library system developed with Ruby on Rails.

## Usage

### 1. Configure your database

This project uses Postgresql as a database.
Postgresql can be downloaded here: https://www.postgresql.org/download/

From the terminal run

```bash
psql postgres
create role railslibrary with createdb login password 'SomePassword';
```

Navigate to the project directory and run

```bash
bundle install
bundle exec figaro install
```

The figaro install command will create an application.yml file in the project's config directory and add this file to the project's git ignore.

Inside config/application.yml paste

```bash
RAILS_LIBRARY_PASSWORD: "SomePassword"
```

Save the change then run

```bash
rails db:create
rails db:schema:load
```

### 2. Run the application

In the app directory run

```bash
bundle exec guard
```

In a separate terminal, in the app directory, run

```bash
rails s
```
