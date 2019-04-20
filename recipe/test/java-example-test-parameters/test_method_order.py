import sys, os, unittest

class Test_JCC_order(unittest.TestCase):
    def setUp(self):
        import test2
        tmp = test2.initVM()

    def test_method_single_parameter_order(self):
        from org.jcc.test import Test_parameter_order, Cat, Animal, Feline, Mammal, Snake
        forest = Test_parameter_order()
        # Single Parameter Order Check
        assert type(forest.getNewOne(Cat())) == type(Cat())
        assert type(forest.getNewOne(Animal())) == type(Animal())
        assert type(forest.getNewOne(Feline())) == type(Feline())
        assert type(forest.getNewOne(Mammal())) == type(Mammal())
        assert type(forest.getNewOne(Snake())) == type(Snake())
        print('Single matching OK')

    def test_method_double_parameter_order(self):
        from org.jcc.test import Test_parameter_order, Cat, Animal, Feline, Mammal, Snake
        forest = Test_parameter_order()
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
        assert type(forest.getNewOne(Animal(), Cat())) == type(Mammal())

        print('Double matching OK')

    def test_constructor_single_parameter_order(self):
        from org.jcc.test import Test_parameter_order, Cat, Animal, Feline, Mammal, Snake

        assert Test_parameter_order().constructor_name == "None"
        assert Test_parameter_order(Animal()).constructor_name == "Animal"
        assert Test_parameter_order(Mammal()).constructor_name == "Mammal"
        assert Test_parameter_order(Feline()).constructor_name == "Feline"
        assert Test_parameter_order(Snake()).constructor_name == "Snake"
        assert Test_parameter_order(Cat()).constructor_name == "Cat"

        print('Constructor single matching OK')

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(Test_JCC_order)
    ret = not unittest.TextTestRunner(verbosity=2).run(suite).wasSuccessful()
    sys.exit(ret)