# Thanx to pvvx!
set AR="C:\Espressif\xtensa-lx106-elf\bin\xtensa-lx106-elf-ar"
set OBJCP="C:\Espressif\xtensa-lx106-elf\bin\xtensa-lx106-elf-objcopy"

mkdir rebuild
cd rebuild
%AR% x ../libgcc.a

pause
for /f "delims=" %%f in (../rom_files_list.txt) do del "%%f.o"
for /f "delims=" %%f in (../removing_files_list.txt) do del "%%f.o"
for /f "delims=" %%f in (../irom_files_list.txt) do %OBJCP% --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal "%%f.o"

del ..\libmicrogcc.a
%AR% ru ..\libmicrogcc.a *.o
cd ..

pause