#!/bin/bash

$PYTHON test/myrun_test.py

pushd test/java-example
  source build_and_wrap.sh
popd

$PYTHON test/java-example/test_test1.py

$PYTHON test/test_double_array.py

pushd test/java-example-test-parameters
  source build_and_wrap_Test_parameters.sh
popd

$PYTHON test/java-example-test-parameters/test_method_order.py
