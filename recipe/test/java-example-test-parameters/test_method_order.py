import sys, os
import test2
tmp = test2.initVM()

from test2 import Test_parameter_order, Cat, Animal, Feline, Mammal, Snake

forest = Test_parameter_order()

assert type(forest.getNewOne(Cat())) == type(Cat())
assert type(forest.getNewOne(Animal())) == type(Animal())
assert type(forest.getNewOne(Feline())) == type(Feline())
assert type(forest.getNewOne(Mammal())) == type(Mammal())
assert type(forest.getNewOne(Snake())) == type(Snake())

print('interaction w java worked!')

sys.exit(False)