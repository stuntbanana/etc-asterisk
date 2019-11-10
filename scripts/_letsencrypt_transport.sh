#!/bin/bash
if [ -d /etc/letsencrypt ]; then
  echo cert_file=/etc/letsencrypt/live/$(hostname)/fullchain.pem
  echo priv_key_file=/etc/letsencrypt/live/$(hostname)/privkey.pem
else
  cat /etc/asterisk/private/transport-ssl
fi

