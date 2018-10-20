import sys, os
import test1
tmp = test1.initVM()

from test1 import test1class

a = test1class()
assert a.addOne(41) == 42

print('interaction w java worked!')

sys.exit(False)