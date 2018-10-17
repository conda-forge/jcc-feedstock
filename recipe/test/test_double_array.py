import sys, os
import test1

tmp = test1.initVM()
try:
    from test1 import JArray
    outer_array = JArray('object')(5)
    outer_array[2] = JArray('double')([1.0, 2.0])

except:
    print('Error creating double array')
    sys.exit(True)

print('Double array test successful.')
sys.exit(False)