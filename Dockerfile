FROM bitwalker/alpine-elixir-phoenix

ARG MIX_ENV
ARG GCP_JSON

# Set exposed ports
EXPOSE 80
ENV PORT=80 MIX_ENV=${MIX_ENV} GOOGLE_APPLICATION_CREDENTIALS=${GCP_JSON}

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets/ && \
    npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN cd assets && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

CMD ["mix", "phx.server"]