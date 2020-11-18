# Defined in - @ line 1
function snapch --wraps='sudo timeshift --check' --description 'alias snapch=sudo timeshift --check'
  sudo timeshift --check $argv;
end
