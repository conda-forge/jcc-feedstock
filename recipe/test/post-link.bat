::@echo off
@echo on

:: This is a hack to mitigate that windows dont detect prefixes
echo INCLUDES=[r'%PREFIX%\Library\include', r'%PREFIX%\Library\include\win32'] >> "%PREFIX%\Lib\site-packages\jcc\config.py"
echo LFLAGS=['/DLL', r'/LIBPATH:%PREFIX%\lib', 'Ws2_32.lib', 'jvm.lib'] >> "%PREFIX%\Lib\site-packages\jcc\config.py"

