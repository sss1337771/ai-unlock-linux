# Обход блокировки нейросетей в России для Linux

Автоматически обновляет IP-адреса для доступа к заблокированным сервисам (Gemini, ChatGPT и другим) через `/etc/hosts`.

## 🛠 Установка
```bash
# 1. Клонируем репозиторий
git clone https://github.com/sss1337771/linux-gemeni-russia
cd linux-gemeni-russia

# 2. Даем права на скрипт
chmod +x AI_Unlock.sh

# 3. Запускаем вручную (требует sudo)
sudo sh AI_Unlock.sh
```
P.S.(Проверено пока только на федоре)

## ⚙️ Автоматическое обновление (через cron)
```bash
# Копируем скрипт и cron-файл
sudo cp update-hosts.sh /usr/local/bin/
sudo cp cron-job /etc/cron.d/unlock-hosts

# Проверяем
sudo systemctl restart cron
```

## 🔄 Как это работает?
Скрипт использует альтернативные DNS-серверы (AdGuard, ControlD) для получения актуальных IP и подменяет их в `/etc/hosts`.

## ⚠️ Важно
- IP могут меняться! Скрипт обновляет их раз в сутки.
- Для GitHub рекомендуется использовать SSH:
  ```bash
  git clone git@github.com:user/repo.git
  ```

## 📜 Лицензия
MIT — свободное использование с указанием авторства.
