# Defined in - @ line 1
function ls --wraps='ls -hv --color=auto --group-directories-first' --description 'alias ls=ls -hv --color=auto --group-directories-first'
 command ls -hv --color=auto --group-directories-first $argv;
end
