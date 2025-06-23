#!/bin/bash
if ! command -v nginx >/dev/null 2>&1; then
  apt-get update
  apt-get install -y nginx
fi

if systemctl list-units --type=service | grep -q nginx; then
  systemctl reload nginx || systemctl restart nginx
else
  systemctl start nginx
fi
