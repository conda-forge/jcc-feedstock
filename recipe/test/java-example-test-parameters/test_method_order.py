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
print("type(forest.getNewOne(Mammal(), Mammal()))", type(forest.getNewOne(Mammal(), Mammal())))
assert type(forest.getNewOne(Mammal(), Mammal())) == type(Mammal())

print ("type(forest.getNewOne(Animal(), Animal()))",type(forest.getNewOne(Animal(), Animal())))
assert type(forest.getNewOne(Animal(), Animal())) == type(Animal())

print ("type(forest.getNewOne(Snake(), Snake()))", type(forest.getNewOne(Snake(), Snake())))
assert type(forest.getNewOne(Snake(), Snake())) == type(Snake())

print ("type(forest.getNewOne(Feline(), Feline()))", type(forest.getNewOne(Feline(), Feline())))
assert type(forest.getNewOne(Feline(), Feline())) == type(Feline())

print ("type(forest.getNewOne(Cat(), Cat()))", type(forest.getNewOne(Cat(), Cat())))
assert type(forest.getNewOne(Cat(), Cat())) == type(Cat())

print ("type(forest.getNewOne(Animal(), Cat()))", type(forest.getNewOne(Animal(), Cat())))
assert type(forest.getNewOne(Animal(), Cat())) == type(Cat())

print('Double matching OK')

sys.exit(False)