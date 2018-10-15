import sys, os

try:
    if "JCC_JDK" in os.environ:
        print ('JCC_JDK = ', os.environ['JCC_JDK'])

    import jcc
    tmp = jcc.initVM()
    print ("JCC test OK")
    print ('java version', tmp.java_version)


except ImportError:
    print ('JCC Import Error')
    sys.exit(1)

except:
    print ('JCC error. Likely your JCC_JDK is wrong..')
    sys.exit(1)

sys.exit(False)
