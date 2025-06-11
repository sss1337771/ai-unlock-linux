#!/bin/bash

# Проверка прав root
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите скрипт от имени root-пользователя."
  exit 1
fi

echo "Данный скрипт обходит региональные ограничения ИИ: ChatGPT, Gemini, Microsoft Copilot, Claude, Bing."
echo "Использует файл Hosts для перенаправления запросов."

# Добавление записей в /etc/hosts
echo "" >> /etc/hosts # Add an empty line before custom hosts for better readability
echo "# ====== CUSTOM HOSTS FOR AI UNBLOCK ======" >> /etc/hosts

# Google
echo "# Google" >> /etc/hosts
while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s ]]; then
    echo "Добавляется запись: $line"
  fi
  echo "$line" >> /etc/hosts
done << 'EOF'
89.108.98.20  aitestkitchen.withgoogle.com
89.108.98.20  alkalimakersuite-pa.clients6.google.com
89.108.98.20  assistant-s3-pa.googleapis.com
89.108.98.20  assistantfrontend-pa.googleapis.com
89.108.98.20  firebaseinstallations.googleapis.com
89.108.98.20  aisandbox-pa.googleapis.com
89.108.98.20  geller-pa.googleapis.com
89.108.98.20  labs.google
89.108.98.20  generativelanguage.googleapis.com
89.108.98.20  lamssettings-pa.googleapis.com
89.108.98.20  notebooklm.google
89.108.98.20  notebooklm.google.com
89.108.98.20  notifications-pa.googleapis.com
89.108.98.20  o.pki.goog
89.108.98.20  proactivebackend-pa.googleapis.com
89.108.98.20  searchnotifications-pa.googleapis.com
89.108.98.20  speechs3proto2-pa.googleapis.com
89.108.98.20  gemini.google.com
EOF

# OpenAI
echo "" >> /etc/hosts
echo "# OpenAI" >> /etc/hosts
while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s ]]; then
    echo "Добавляется запись: $line"
  fi
  echo "$line" >> /etc/hosts
done << 'EOF'
89.108.98.20  ab.chatgpt.com
89.108.98.20  android.chat.openai.com
89.108.98.20  auth.openai.com
89.108.98.20  auth0.openai.com
89.108.98.20  cdn.auth0.com
89.108.98.20  cdn.oaistatic.com
89.108.98.20  chatgpt.com
89.108.98.20  files.oaiusercontent.com
89.108.98.20  platform.openai.com
89.108.98.20  tcr9i.chat.openai.com
89.108.98.20  webrtc.chatgpt.com
EOF

# Copilot / Bing
echo "" >> /etc/hosts
echo "# Copilot / Bing" >> /etc/hosts
while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s ]]; then
    echo "Добавляется запись: $line"
  fi
  echo "$line" >> /etc/hosts
done << 'EOF'
89.108.98.20  bing.com
89.108.98.20  bing.net
89.108.98.20  bingapis.com
89.108.98.20  bingclientmsa.sapphire.microsoftapp.net
89.108.98.20  edge.microsoft.com
89.108.98.20  edgeservices.bing.com
89.108.98.20  gateway.bingviz.microsoftapp.net
89.108.98.20  img-s-msn-com.akamaized.net
89.108.98.20  in.appcenter.ms
89.108.98.20  login.microsoftonline.com
89.108.98.20  mobile.events.data.microsoft.com
89.108.98.20  prod.rewardsplatform.microsoft.com
89.108.98.20  prod-switzerlandnorth.access-point.cloudmessaging.edge.microsoft.com
89.108.98.20  sapphire.api.microsoftapp.net
89.108.98.20  self.events.data.microsoft.com
89.108.98.20  copilot.microsoft.com
89.108.98.20  ssl.bing.com
89.108.98.20  superapp.msn.com
89.108.98.20  th.bing.com
89.108.98.20  sydney.bing.com
89.108.98.20  www.bing.com
89.108.98.20  www.bingapis.com
89.108.98.20  www.msn.com
89.108.98.20  api.msn.com
89.108.98.20  assets.msn.com
89.108.98.20  c.msn.com
89.108.98.20  prod-streaming-video-msn-com.akamaized.net
89.108.98.20  location.microsoft.com
89.108.98.20  prod-japaneast.access-point.cloudmessaging.edge.microsoft.com
89.108.98.20  swiftkey.com
89.108.98.20  data.swiftkey.com
EOF

# Other
echo "" >> /etc/hosts
echo "# Other" >> /etc/hosts
while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\s ]]; then
    echo "Добавляется запись: $line"
  fi
  echo "$line" >> /etc/hosts
done << 'EOF'
89.108.98.20  claude.ai
89.108.98.20  www.notion.so
89.108.98.20  ai-chat.bsg.brave.com
EOF

echo "" >> /etc/hosts
echo "# ====== END OF CUSTOM HOSTS ======" >> /etc/hosts

echo "Записи успешно добавлены в /etc/hosts."
