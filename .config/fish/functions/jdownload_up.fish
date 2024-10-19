function jdownload_up --wraps=scp --description 'upload ddl file to jdownloader server'
    command echo "$argv"| xargs -I _ -- scp _ hs-macmini:infiles;
end

