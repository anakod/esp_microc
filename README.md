# esp_microc
ESP8266 micro standard c library based on [musl](http://www.musl-libc.org)

Project goals - build minimalistic and portable standard с library to prevent unnecessary memory utilization and writing work-around code like **os_malloc**, **os_strcmp** and etc.

Everywhere when we aready have ESP method implementation in ROM firmware, we are trying using this one to save additional flash space.

For full ROM methods list please look *eagle.rom.addr.v6.ld* file from Espressif SDK.

## rebuild_micro_gcc
Scipts for rebuildig standard libgcc for removing all methods what already implemented in ROM firmware. Also it will move some not important and larger methods to IROM section (look irom_files_list.txt for details).

Special thanks to **pvvx** for great libgcc idea!
