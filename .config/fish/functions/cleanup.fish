# Defined in - @ line 1
function cleanup --wraps='sudo pacman -Rsn (pacman -Qtdq)' --description 'alias cleanup=sudo pacman -Rsn (pacman -Qtdq)'
  sudo pacman -Rsn (pacman -Qtdq) $argv;
end
