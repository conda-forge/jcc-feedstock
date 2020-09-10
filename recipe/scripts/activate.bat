:: Store existing env vars and set to this conda env
:: so other installs don't pollute the environment.

@if defined JCC_JDK (
    set "_JCC_JDK_CONDA_BACKUP=%JCC_JDK%"
)
set "JCC_JDK=%CONDA_PREFIX%\Library"

@set "_JCC_PATH_CONDA_BACKUP=%PATH%"
@set "PATH=%CONDA_PREFIX%\Library\jre\bin\server;%CONDA_PREFIX%\Library;%CONDA_PREFIX%\Library\jre\bin;%PATH%"

:: adding compile parameters explicitly as relocation for conda does not seem to detect JCC  path properly
@set "JCC_INCLUDES=%CONDA_PREFIX%\Library\include;%CONDA_PREFIX%\Library\include\win32"
@set "JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS"
@set "JCC_LFLAGS=/DLL;/LIBPATH:%CONDA_PREFIX%\Library\lib;Ws2_32.lib;jvm.lib"
@set "JCC_DEBUG_CFLAGS=/Od;/DDEBUG"
@set "JCC_JAVAC=%CONDA_PREFIX%\Library\bin\javac.exe"
@set "JCC_JAVADOC=%CONDA_PREFIX%\Library\bin\javadoc.exe"