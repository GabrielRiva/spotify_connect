# Use the Home Assistant base
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Pacotes do Alpine necessários para compilar
RUN apk add --no-cache \
    build-base \
    git \
    pulseaudio \
    pulseaudio-dev \
    alsa-utils \
    alsa-lib-dev \
    dbus \
    dbus-dev \
    curl \
    openssl-dev \
    pkgconfig \
    && rm -rf /var/cache/apk/*

# Instala rustup (sempre pega toolchain recente)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Compila e instala o librespot v0.7.0
WORKDIR /usr/src
RUN git clone --branch v0.7.0 https://github.com/librespot-org/librespot.git \
    && cd librespot \
    && cargo build --release --locked \
    && cp target/release/librespot /usr/bin/ \
    && cd .. \
    && rm -rf librespot

# Copia scripts de inicialização
COPY run.sh /run.sh
RUN chmod a+x /run.sh

LABEL \
    io.hass.name="Spotify Connect (Custom)" \
    io.hass.description="Play Spotify music on your Home Assistant device (librespot v0.7.0)" \
    io.hass.version="0.16.1-custom" \
    maintainer="Gabriel Riva <gabriel@casaesperta>"

CMD [ "/run.sh" ]
