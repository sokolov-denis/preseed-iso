# Описание

Набор мейкфайлов и bash-скриптов для модификации официальных установчных ISO-образов Debian и Ubuntu. Основной целью является создание ISO-Образов для автоматической установки.

## Использование

```bash
apt-get install git make genisoimage p7zip-full

git clone https://github.com/sokolov-denis/preseed-iso

make debian-8.8.0-amd64-netinst.iso
make debian-9.0.0-amd64-netinst.iso
make ubuntu-16.04.2-server-amd64.iso
```

## Как это работает

1. ISO-образ загружается в `cache/` и, при помощи **7z**, распаковывается во временный каталог.

1. В полученное дерево каталогов копируются:

    1. конфигурационные файлы загрузчика **isolinux** модифицированные для автоматического запуска с нужными параметрами;

    1. файлы **preseed** с настройками для автоматической установки Debian/Ubuntu;

    1. каталог `provisioning`, который содержит скрипты и файлы для предварительной настройки системы после установки.

1. После этого при помощи genisoimage упаковывается новый ISO-образ.

## Provisioning

1. В подкаталоги `provisioning/scripts` добавляются скрипты которые будут выполнены сразу после установки системы. Скрипты из `scripts/common` будут выполнены всегда, из `scripts/debian` только для Debian, из `scripts/ubuntu` только для Ubuntu.

1. Все открытые ключи SSH помещённые в каталог `provisioning/files/authorized_keys` в виде файлов с расширением `pub` будут добавлены в `/root/.ssh/authorized_keys`.
