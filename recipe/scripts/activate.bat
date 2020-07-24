:: Store existing env vars and set to this conda env
:: so other installs don't pollute the environment.
setlocal enabledelayedexpansion

@if defined JCC_JDK (
    set "_JCC_JDK_CONDA_BACKUP=%JCC_JDK%"
)
set "JCC_JDK=%CONDA_PREFIX%\Library"

@set "_JCC_PATH_CONDA_BACKUP=%PATH%"
@set "PATH=%JCC_JDK%\jre\bin\server;%JCC_JDK%;%JCC_JDK%\jre\bin;%PATH%"

:: adding compile parameters explicitly as relocation for conda does not seem to detect JCC  path under windows
@set "JCC_INCLUDES=%JCC_JDK%\include;%JCC_JDK%\include\win32"
@set "JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS"
@set "JCC_LFLAGS=/DLL;/LIBPATH:%JCC_JDK%\lib;Ws2_32.lib;jvm.lib"
@set "JCC_DEBUG_CFLAGS=/Od;/DDEBUG"
@set "JCC_JAVAC=%JCC_JDK%\bin\javac.exe"
@set "JCC_JAVADOC=%JCC_JDK%\bin\javadoc.exe"