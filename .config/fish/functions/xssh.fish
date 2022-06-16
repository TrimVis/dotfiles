# Defined in - @ line 1
function xssh --wraps='ssh' --description 'alias xssh = TERM=xterm-256color ssh'
  TERM=xterm-256color ssh $argv;
end
