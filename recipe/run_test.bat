"%PYTHON%" test/myrun_test.py
if errorlevel 1 exit 1

pushd test\java-example
  call "build_and_wrap.bat"
  if errorlevel 1 exit 1
popd

"%PYTHON%" test/test_test1.py
if errorlevel 1 exit 1

"%PYTHON%" test/test_double_array.py
if errorlevel 1 exit 1