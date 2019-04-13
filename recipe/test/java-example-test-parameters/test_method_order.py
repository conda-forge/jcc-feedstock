import sys, os
import test2
tmp = test2.initVM()

from test2 import Test_parameter_order, Cat, Animal, Feline, Mammal, Snake

forest = Test_parameter_order()

# Single Parameter Order Check
assert type(forest.getNewOne(Cat())) == type(Cat())
assert type(forest.getNewOne(Animal())) == type(Animal())
assert type(forest.getNewOne(Feline())) == type(Feline())
assert type(forest.getNewOne(Mammal())) == type(Mammal())
assert type(forest.getNewOne(Snake())) == type(Snake())
print('Single matching OK')

# Double Parameter order check
assert type(forest.getNewOne(Mammal(), Mammal())) == type(Mammal())
assert type(forest.getNewOne(Animal(), Animal())) == type(Animal())
assert type(forest.getNewOne(Cat(), Cat())) == type(Cat())
assert type(forest.getNewOne(Animal(), Cat())) == type(Cat())
print('Double matching OK')

sys.exit(False)