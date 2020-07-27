setlocal enabledelayedexpansion

echo "---- STARTING BUILD FILE ----"

:: Paths assume openjdk installed by conda
set JCC_JDK=%CONDA_PREFIX%\Library

:: JCC needs to have libraries in PATH
set PATH=%CONDA_PREFIX%\Library\jre\bin\server;%CONDA_PREFIX%\Library;%CONDA_PREFIX%\Library\jre\bin;%CONDA_PREFIX%\Library\jre\lib;%PATH%

set "JCC_INCLUDES=%CONDA_PREFIX%\Library\include;%CONDA_PREFIX%\Library\include\win32"
set "JCC_CFLAGS=/EHsc;/D_CRT_SECURE_NO_WARNINGS"
set "JCC_LFLAGS=/DLL;/LIBPATH:%JAVA_HOME%\lib;Ws2_32.lib;jvm.lib"
set "JCC_DEBUG_CFLAGS=/Od;/DDEBUG"
set "JCC_JAVAC=%CONDA_PREFIX%\Library\bin\javac.exe"
set "JCC_JAVADOC=%CONDA_PREFIX%\Library\bin\javadoc.exe"

"%PYTHON%" -m pip install . --no-deps -vv
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
