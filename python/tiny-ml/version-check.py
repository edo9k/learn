
# check versions of all the required shit

import sys
import scipy,  numpy
import pandas, sklearn
import matplotlib

print("""
-- lang
python:  {}

-- libs
scipy:   {}
numpy:   {}
matplot: {}
pandas:  {}
sklearn: {}
""".format( 
    sys.version, 
    scipy.__version__, 
    numpy.__version__,
    matplotlib.__version__, 
    pandas.__version__,
    sklearn.__version__
))

