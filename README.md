UDL драйве DisplayLink DL-1xx для Repka Pi 3
========


Подключение USB дислея в Repka Pi 3


Установка
----------

  $ apt-get update

  $ apt-get install git

  $ git clone https://github.com/screatorpro/UDL-Repka-Pi.git

  $ cd UDL-Repka-Pi

  $ make install


Настройк дисплея


Поддерживаемые модели платы
----------

* Repka Pi 3



Настройка дисплея
----------

После установки проверим наличие fb устройства `ls /dev/fb*`. Если у вас подключен монитор через HDMI, то должно быть 2 устройства

Проверим какое устройство у DisplayLink командой `dmesg | grep udl` находим примерно такую строку, из нее видно, что udl устройство fb0


  udl 4-1.4:1.0: [drm] fb0: udldrmfb frame buffer device

Создаем файл настроек X11

    nano /usr/share/X11/xorg.conf.d/60-displaylink.conf

Вставляем следующий текст

```
    Section "Device"
      Identifier "uga"
      driver "fbdev" 
      Option "fbdev" "/dev/fb0" 
      Option "ShadowFB" "off"
    EndSection 
    Section "Monitor" 
      Identifier "monitor" 
    EndSection 
    Section "Screen" 
      Identifier "screen" 
      Device "uga" 
      Monitor "monitor" 
    EndSection 
    Section "ServerLayout" 
      Identifier "default" 
      Screen 0 "screen" 0 0 
    EndSection
```

Перезагружаемся

