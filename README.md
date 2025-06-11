# Обход блокировки Gemini/GitHub в Linux

Автоматически обновляет IP-адреса для доступа к заблокированным сервисам (Gemini, GitHub и другим) через `/etc/hosts`.

## 🔧 Поддерживаемые сервисы
- Gemini (`gemini.google.com`)
- GitHub (`github.com`, `raw.githubusercontent.com`)
- Claude AI (`claude.ai`)
- Copilot (`copilot.microsoft.com`)

## 🛠 Установка
```bash
# 1. Клонируем репозиторий
git clone https://github.com/ваш-логин/unlock-gemini-linux.git
cd unlock-gemini-linux

# 2. Даем права на скрипт
chmod +x update-hosts.sh

# 3. Запускаем вручную (требует sudo)
sudo ./update-hosts.sh
```

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
