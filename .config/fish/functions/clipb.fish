# Defined in - @ line 1
function clipb --wraps='xclip -sel clip' --description 'alias clipb=xclip -sel clip'
  xclip -sel clip $argv;
end
