FROM bitwalker/alpine-elixir-phoenix:latest AS phx-build 
ARG MIX_ENV=prod

ENV MIX_ENV=${MIX_ENV}

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
    mix do compile, phx.digest && \
    rm -rf /tmp

FROM bitwalker/alpine-elixir:latest
ARG MIX_ENV=prod
ARG PORT=80

# Set exposed ports
EXPOSE ${PORT}
ENV PORT=${PORT} MIX_ENV=${MIX_ENV}

COPY --from=phx-build /opt/app/ /opt/app/

CMD ["mix", "phx.server"]
