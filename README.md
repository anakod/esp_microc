# esp_microc
ESP8266 micro standard c library based on [musl](http://www.musl-libc.org)

Project goals - build minimalistic and portable standard с library to prevent unnecessary memory utilization and writing work-around code like **os_malloc**, **os_strcmp** and etc.

Everywhere when we aready have ESP methods implementation in firmware, we are trying using this one to save additional flash space.
