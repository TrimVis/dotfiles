# Defined in - @ line 1
function unison --wraps='unison -logfile=/tmp/unison.log' --description 'alias unison unison -logfile=/tmp/unison.log'
 command unison -logfile=/tmp/unison.log $argv;
end
