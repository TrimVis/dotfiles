# Defined in - @ line 1
function mnt --wraps='udisksctl mount -b' --description 'alias mnt=udisksctl mount -b'
  udisksctl mount -b $argv;
end
