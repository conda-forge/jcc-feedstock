javac org/jcc/test/Test_parameter_order.java org/jcc/test/Animal.java org/jcc/test/Cat.java org/jcc/test/Feline.java org/jcc/test/Mammal.java org/jcc/test/Snake.java org/jcc/test/Being.java

jar cf Test_parameter_order.jar org

python -m jcc --use_full_names --find-jvm-dll server --jar Test_parameter_order.jar --python test2  --package org.jcc.test --build --install
