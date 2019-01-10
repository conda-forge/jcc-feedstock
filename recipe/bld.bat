:: Paths assume openjdk installed by conda
set JCC_JDK=%JAVA_HOME%

::  set all of the environment variables JCC_JDK, JCC_INCLUDES, JCC_CFLAGS, JCC_DEBUG_CFLAGS, JCC_LFLAGS, JCC_JAVAC and JCC_JAVADOC, using os.pathsep as value separator to override them.
:: JCC needs to have libraries in PATH
set PATH=%JCC_JDK%\jre\bin\server;%JCC_JDK%;%JCC_JDK%\jre\bin;%JCC_JDK%\jre\lib;%PATH%

set JCC_INCLUDES=%JCC_JDK%\include;%JCC_JDK%\include\win32
set JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS
set JCC_LFLAGS=/DLL;/LIBPATH:%JCC_JDK%\lib;Ws2_32.lib;jvm.lib
set JCC_DEBUG_CFLAGS=/Od;/DDEBUG
set JCC_JAVAC=%JCC_JDK%\bin\javac.exe
set JCC_JAVADOC=%JCC_JDK%\bin\javac.exe



"%PYTHON%" setup.py install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1

:: ensure that JCC_JDK is set correctly by invoking an activate script
set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\jcc-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\jcc-deactivate.bat
if errorlevel 1 exit 1
