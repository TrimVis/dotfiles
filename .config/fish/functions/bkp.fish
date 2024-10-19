# Defined in - @ line 1
function bkp --wraps=restic --description 'Personal restic backups'
    restic -r "sftp:hs-macmini:/mnt/backup/restic/personal" $argv
end
