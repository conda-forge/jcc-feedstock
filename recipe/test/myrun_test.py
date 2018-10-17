import sys, os

try:
    if "JCC_JDK" in os.environ:
        print ('JCC_JDK = ', os.environ['JCC_JDK'])

    import jcc
    tmp = jcc.initVM()
    print ("JCC test OK")
    print ('java version', tmp.java_version)

except ImportError as e:
    print ('JCC Import Error')
    print(e)
    sys.exit(1)

except Exception as e:
    print ('JCC error. Likely your JCC_JDK is wrong..')
    print(e)
    sys.exit(1)

sys.exit(False)
