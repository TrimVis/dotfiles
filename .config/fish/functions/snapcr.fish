# Defined in - @ line 1
function snapcr --wraps='sudo timeshift --create' --description 'alias snapcr=sudo timeshift --create'
  sudo timeshift --create $argv;
end
