:: Restore previous JCC_JDK and PATH env vars if they were set.

set "JCC_JDK="
if defined _JCC_JDK_CONDA_BACKUP (
  set "JCC_JDK=%_JCC_JDK_CONDA_BACKUP%"
  set "_JCC_JDK_CONDA_BACKUP="
)

if defined _JCC_PATH_CONDA_BACKUP (
    set "PATH =%_JCC_PATH_CONDA_BACKUP%"
    set "_JCC_PATH_CONDA_BACKUP="
)

:: adding compile parameters explicitly as relocation for conda does not seem to detect JCC under windows
@set "JCC_INCLUDES="
@set "JCC_CFLAGS="
@set "JCC_LFLAGS="
@set "JCC_DEBUG_CFLAGS="
@set "JCC_JAVAC="
@set "JCC_JAVADOC="