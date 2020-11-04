# Defined in - @ line 1
function wget --wraps=wget\ --hsts-file=\'\$HOME/.config/.wget-hsts\' --description alias\ wget=wget\ --hsts-file=\'\$HOME/.config/.wget-hsts\'
 command wget --hsts-file='$HOME/.config/.wget-hsts' $argv;
end
