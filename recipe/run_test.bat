"%PYTHON%" test/myrun_test.py
if errorlevel 1 exit 1

pushd test\java-example
  call "build_and_wrap.bat"
  if errorlevel 1 exit 1
popd

"%PYTHON%" test/java-example/test_test1.py
if errorlevel 1 exit 1

"%PYTHON%" test/test_double_array.py
if errorlevel 1 exit 1

pushd test\java-example-test-parameters
  call "build_and_wrap_Test_parameters.bat"
  if errorlevel 1 exit 1
popd

"%PYTHON%" test/java-example-test-parameters/test_method_order.py
if errorlevel 1 exit 1
