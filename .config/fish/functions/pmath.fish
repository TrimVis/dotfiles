# Defined in - @ line 1
function pmath --wraps='python -i -c "import math; import numpy as np; import sympy as sp"' --description 'alias pmath python -i -c "import math; import numpy as np; import sympy as sp"'
  python -i -c "import math; import numpy as np; import sympy as sp" $argv;
end
