setlocal enabledelayedexpansion

echo "---- STARTING BUILD FILE ----"

:: Paths assume openjdk installed by conda
set JCC_JDK=%PREFIX%\Library

:: JCC needs to have libraries in PATH
set PATH=%PREFIX%\Library\jre\bin\server;%PREFIX%\Library;%PREFIX%\Library\jre\bin;%PREFIX%\Library\jre\lib;%PATH%

set "JCC_INCLUDES=%PREFIX%\Library\include;%PREFIX%\Library\include\win32"
set "JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS"
set "JCC_LFLAGS=/DLL;/LIBPATH:%JAVA_HOME%\lib;Ws2_32.lib;jvm.lib"
set "JCC_DEBUG_CFLAGS=/Od;/DDEBUG"
set "JCC_JAVAC=%PREFIX%\Library\bin\javac.exe"
set "JCC_JAVADOC=%PREFIX%\Library\bin\javadoc.exe"

"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt

if errorlevel 1 exit 1

:: ensure that JCC_JDK is set correctly by invoking an activate script

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\scripts\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\scripts\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
)

echo "---- RESULT ----"
set
