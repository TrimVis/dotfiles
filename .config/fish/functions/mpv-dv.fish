# Defined in - @ line 1
function mpv-dv --wraps='mpv --vo=gpu-next --tone-mapping=clip --gamut-mapping-mode=clip' --description 'alias mpv-dv=mpv --vo=gpu-next --tone-mapping=clip --gamut-mapping-mode=clip'
 command mpv --vo=gpu-next --tone-mapping=clip --gamut-mapping-mode=clip $argv;
end
