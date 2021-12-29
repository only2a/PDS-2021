@echo off
call "D:\Mirosoft Visual\VC\Auxiliary\Build\vcvarsall.bat" x86
"D:\KP\PDS-2021\Debug\PDS-2021.exe" -in:"D:\KP\PDS-2021\PDS-2021\example.txt"
pause
ml /c /coff /Zi "D:\KP\PDS-2021\Asm\out.asm"
link /OPT:NOREF /DEBUG /SUBSYSTEM:CONSOLE libucrt.lib out.obj
out.exe
pause