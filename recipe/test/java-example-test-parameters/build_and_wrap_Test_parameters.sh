#!/usr/bin/env bash
javac Test_parameter_order.java Animal.java Cat.java Feline.java Mammal.java Snake.java

jar cf Test_parameter_order.jar org

python -m jcc --use_full_names --jar Test_parameter_order.jar --python test2   --package org.jcc.test --build --install

