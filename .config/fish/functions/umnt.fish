# Defined in - @ line 1
function umnt --wraps='udisksctl unmount -b' --description 'alias umnt=udisksctl unmount -b'
  udisksctl unmount -b $argv;
end
