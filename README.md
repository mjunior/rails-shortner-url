# README

* **Ruby version**
  3.1

* **Database creation**
  rails db:create db:migrate db:migrate

* **How to run the test suite**
  rspec

* **Services (job queues, cache servers, search engines, etc.)**
  bundle exec sidekiq


## Steps to run

**In the terminal 01 execute thse steps**
`bundle i`
`docker compose -f Docker-compose.yml up -d`
`rails db:create db:migrate db:seed`
`rails server`
open a new terminal tab

**Terminal 02**
`bundle exec sidekiq`

### Seed database
Run `rails db:seed` to populate your database. This script will get from `https://en.wikipedia.org/wiki/Wikipedia:Popular_pages` 110 links and generate short urls for all of them.

PS: For some reason this scripts not working, upadte the file seed.rb line 132. Use the backup function `links_from_bkp` instead of `parse_links_from_wikipedia`

### Docker compose
There is a Docker-compose.yml file with `postgres`, `redis` and `adminer`.

To execute it run `docker compose -f Docker-compose.yml up`

PS: The application is not running in a docker container.

### Specs
- Url
  - validations
  - invalid with empty original url
  - invalid with wrong format

- Urls
  - POST /url
    - returns short url
    - returns error if url is invalid
    - should enqueue parse title job
