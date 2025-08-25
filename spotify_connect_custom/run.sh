#!/usr/bin/env bash
set -e

echo "[INFO] Starting Spotify Connect (librespot v0.7.0)..."

exec librespot \
    --name "${HASSIO_NAME:-Home Assistant Spotify}" \
    --backend pulseaudio \
    --bitrate 320 \
    --enable-volume-normalisation \
    --initial-volume 75
