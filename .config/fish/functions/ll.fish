# Defined in - @ line 1
function ll --wraps='ls -lAh' --description 'alias ll ls -lA'
  ls -lA $argv;
end
