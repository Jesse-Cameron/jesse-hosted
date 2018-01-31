# JesseHosted

## Testing

* run `mix test`

## Local development

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Install Node.js dependencies with `cd assets && npm install`
* Build the secret files `./scripts/build.sh`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Docker development

* Install dependencies with `mix deps.get`
* Install Node.js dependencies with `cd assets && npm install`
* Build the secret files `./scripts/build.sh`

### `docker-compose`

* `docker-compose -f docker-compose.dev.yml build`
* `docker-compose -f docker-compose.dev.yml up`

### `docker`

* `docker build -t jessec3/jesse-hosted --build-arg MIX_ENV=prod .`
* `docker run -p 5000:5000 -e MIX_ENV=dev -e GOOGLE_APPLICATION_CREDENTIALS=jesse-hosted-key.json jessec3/jesse-hosted`