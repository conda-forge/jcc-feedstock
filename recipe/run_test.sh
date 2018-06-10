#!/bin/bash

$PYTHON test/myrun_test.py


pushd test/java-example
  source build_and_wrap.sh
popd

$PYTHON test/test_test1.py
