"%PYTHON%" test/myrun_test.py
if errorlevel 1 exit 1

::cd test/java-example
::javac test/java-example/test1.java
::jar cf test1.jar test1.class
::"%PYTHON%" -m jcc --jar test1.jar --python test1 test1 --build --install
::if errorlevel 1 exit 1

pushd test\java-example
  call "build_and_wrap.bat"
  if errorlevel 1 exit 1
popd

"%PYTHON%" test/test_test1.py
if errorlevel 1 exit 1