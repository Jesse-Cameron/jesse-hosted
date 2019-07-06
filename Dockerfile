FROM bitwalker/alpine-elixir-phoenix:1.8.0 AS phx-build 
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
    rm -rf /tmp && \
    rm -rf assets/node_modules

FROM bitwalker/alpine-elixir:1.8.0
ARG MIX_ENV=prod
ARG PORT=80

# Set exposed ports
EXPOSE ${PORT}
ENV PORT=${PORT} MIX_ENV=${MIX_ENV}

COPY --from=phx-build /opt/app/_build /opt/app/_build
COPY --from=phx-build /opt/app/priv /opt/app/priv
COPY --from=phx-build /opt/app/config /opt/app/config
COPY --from=phx-build /opt/app/assets /opt/app/assets
COPY --from=phx-build /opt/app/lib /opt/app/lib
COPY --from=phx-build /opt/app/deps /opt/app/deps
COPY --from=phx-build /opt/app/.mix /opt/app/.mix
COPY --from=phx-build /opt/app/mix.* /opt/app/

CMD ["mix", "phx.server"]
