# This runs the "adam" tests, returning 0 if all mutants are killed, or 1 if
# there's a survivor.

set -e

cosmic-ray load cosmic-ray.unittest.conf
if [ $? != 0 ]; then exit 1; fi
RESULT=`cosmic-ray survival-rate adam_tests.unittest`
if [ $RESULT != 0.00 ]; then
    cosmic-ray report adam_tests.unittest
    exit 1
fi

cosmic-ray load cosmic-ray.pytest.conf
if [ $? != 0 ]; then exit 1; fi
RESULT=`cosmic-ray survival-rate adam_tests.pytest`
if [ $RESULT != 0.00 ]; then
    cosmic-ray report adam_tests.pytest
    exit 1
fi

cosmic-ray load cosmic-ray.nosetest.conf
if [ $? != 0 ]; then exit 1; fi
RESULT=`cosmic-ray survival-rate adam_tests.nosetest`
if [ $RESULT != 0.00 ]; then
    cosmic-ray report adam_tests.nosetest
    exit 1
fi

# Run import tests
cosmic-ray load cosmic-ray.import.conf
if [ $? != 0 ]; then exit 1; fi
RESULT=`cosmic-ray survival-rate import_tests`
if [ $RESULT != 0.00 ]; then
    cosmic-ray report import_tests
    exit 1
fi


exit 0
