#!/usr/bin/env bash
javac org/jcc/test/Test_parameter_order.java org/jcc/test/Animal.java org/jcc/test/Cat.java org/jcc/test/Feline.java org/jcc/test/Mammal.java org/jcc/test/Snake.java

jar cf Test_parameter_order.jar org

python -m jcc --use_full_names --jar Test_parameter_order.jar --python test2 --package org.jcc.test --build --install

