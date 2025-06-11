#!/usr/bin/env bash
# Автоматическое обновление IP для Gemini

DNS_SERVERS=("94.140.14.14" "76.76.2.0" "1.1.1.1")
DOMAINS=(
  "gemini.google.com"
  "github.com"
  "raw.githubusercontent.com"
)

echo "# Обновление /etc/hosts $(date)" | sudo tee /etc/hosts.new
for DOMAIN in "${DOMAINS[@]}"; do
  for DNS in "${DNS_SERVERS[@]}"; do
    IP=$(dig +short @"$DNS" "$DOMAIN" | head -n1)
    if [[ -n "$IP" ]]; then
      echo "$IP $DOMAIN" | sudo tee -a /etc/hosts.new
      break
    fi
  done
done

sudo mv /etc/hosts.new /etc/hosts
