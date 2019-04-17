javac Test_parameter_order.java Animal.java Cat.java Feline.java Mammal.java Snake.java

jar cf Test_parameter_order.jar Test_parameter_order.class Animal.class Cat.class Feline.class Mammal.class Snake.class

python -m jcc --jar Test_parameter_order.jar --python test2  Test_parameter_order --build --install

