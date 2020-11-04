# Defined in - @ line 1
function killtty --wraps='sudo pkill -9 -t' --description 'alias killtty=sudo pkill -9 -t'
  sudo pkill -9 -t $argv;
end
