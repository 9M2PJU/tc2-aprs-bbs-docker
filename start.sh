#!/bin/sh

if [ -n "$TACTICAL_CALLSIGN" -a  -n "$STANDARD_CALLSIGN" ]; then
  sed -i "s/^#TACTICAL_CALLSIGN.*$/TACTICAL_CALLSIGN = ${TACTICAL_CALLSIGN}/g" config.ini
  sed -i "s/^#STANDARD_CALLSIGN.*$/STANDARD_CALLSIGN = ${STANDARD_CALLSIGN}/g" config.ini
fi

if [ -n "$KISS_HOST" -a  -n "$KISS_PORT" ]; then
  sed -i "s/^#KISS_HOST.*$/KISS_HOST = ${KISS_HOST}/g" config.ini
  sed -i "s/^#KISS_PORT.*$/KISS_PORT = ${KISS_PORT}/g" config.ini
fi

if [ -n "$BULLETIN_EXPIRATION_DAYS" ]; then
  sed -i "s/^#BULLETIN_EXPIRATION_DAYS.*$/BULLETIN_EXPIRATION_DAY = ${BULLETIN_EXPIRATION_DAY}/g" config.ini
fi

if [ -n "$APRS_PATH" ]; then
  sed -i "s/^#APRS_PATH.*$/APRS_PATH = ${APRS_PATH}/g" config.ini
fi

if [ -n "$RAW_PACKET_DISPLAY" ]; then
  sed -i "s/^#RAW_PACKET_DISPLAY.*$/RAW_PACKET_DISPLAY = ${RAW_PACKET_DISPLAY}/g" config.ini
fi

if [ ! -f "/config/config.ini" ]; then
    cp "/TC2-APRS-BBS/config.ini" "/config/config.ini"
fi
