#!/bin/bash
if curl -i http://169.254.169.254/ 2>/dev/null | grep -q "200 OK" ; then
  echo external_media_address=$(curl http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null)
  echo external_signaling_address=$(curl http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null)
  for x in $(curl http://169.254.169.254/latest/meta-data/network/interfaces/macs 2>/dev/null | cut -d/ -f1); do
    echo local_net=$(curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/${x}/subnet-ipv4-cidr-block 2>/dev/null)
  done
else
  cat /etc/asterisk/private/transport
fi

