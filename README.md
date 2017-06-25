# Notes project

Notes project on RoR & MongoDB

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

* `phantomjs` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

### Bootstrap application

1. Clone application as new project with original repository named "rails-base-mongo".

   ```bash
   git clone git://github.com/ArthurZaharov/rails-base-mongo.git --origin rails-base-mongo [MY-NEW-PROJECT]
   ```

2. Create your new repo on GitHub and push master into it. Make sure master branch is tracking origin repo.

  ```bash
  git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
  git push -u origin master
  ```

3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/ci
  ```

5. Run app

  ```bash
  bin/server
  ```

## Deployment

### Heroku

```bash
heroku create --addons=heroku-postgresql,sendgrid,newrelic,rollbar --remote staging rails-base-mongo-example
heroku config:add HOST="rails-base-mongo-example.herokuapp.com" MAILER_SENDER_ADDRESS="noreply@rails-base-mongo-example.herokuapp.com" NEW_RELIC_APP_NAME="Rails Base Mongo"
git push staging master
heroku run rake db:schema:load
heroku open
```
