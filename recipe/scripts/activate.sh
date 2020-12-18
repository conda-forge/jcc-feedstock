#!/bin/bash

# Store existing env vars and set to this conda env
# so other installs don't pollute the environment.

if [[ -n "JCC_JDK" ]]; then
    export _JCC_JDK_CONDA_BACKUP=$JCC_JDK
fi

export JCC_JDK=${CONDA_PREFIX}


if [ "$(uname)" == "Darwin" ]
then
  export JCC_ARGSEP=";"
  export JCC_INCLUDES="${CONDA_PREFIX}/include;${CONDA_PREFIX}/include/darwin"
  export JCC_LFLAGS="-v;-L${CONDA_PREFIX}/jre/lib;-ljava;-L${CONDA_PREFIX}/jre/lib/server;-ljvm;-Wl,-rpath;-Wl,${CONDA_PREFIX}/jre/lib;-Wl,-rpath;-Wl,${CONDA_PREFIX}/jre/lib/server;-mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET"
	export JCC_CFLAGS="-fno-strict-aliasing;-Wno-write-strings;-Qunused-arguments;-mmacosx-version-min=10.9;-std=c++11;-stdlib=libc++"
  export JCC_DEBUG_CFLAGS="-O0;-g;-DDEBUG"
  export JCC_JAVAC="javac;-source;1.8;-target;1.8"
  export JCC_JAVADOC="javadoc"

else
  # GNU/Linux recipe
  export JCC_ARGSEP=";"
	export JCC_LFLAGS="-v;-Wl,-v;-L${CONDA_PREFIX}/lib;-ljava;-L${CONDA_PREFIX}/lib/server;-ljvm;-lverify;-Wl,-rpath=${CONDA_PREFIX}/lib:${CONDA_PREFIX}/lib/server"
	export JCC_JAVAC=${CONDA_PREFIX}/bin/javac
	export JCC_CFLAGS="-v;-fno-strict-aliasing;-Wno-write-strings;-D__STDC_FORMAT_MACROS"
  export JCC_DEBUG_CFLAGS="-O0;-g;-DDEBUG"
  export JCC_JAVADOC="javadoc"

fi