This repo contains most of my dot files, which otherwise would be a pain in the
ass to share synchronize between machines.


# Todo:

* [x] Add dot files which should be the same on both machines to master branch
* [x] Merge master branch into laptop and tower branch
* [x] Add machine specific files to the corresponding branches

* [x] Switch over to bspwm
* [ ] Setup temporary volume/brightness hotkeys
* [ ] Rewrite volume/brightness scripts

* [x] Setup basic polybar things
* [ ] Open things on click in polybar
* [ ] Add music widget in polybar
* [ ] Add weather widget in polybar
* [ ] Use fancy awesomeFont icons for animations, etc



# Usefule git commands:

```
git checkout A
git checkout --patch B f
```

This command replaces the file f in branch A with the file f of branch B
(only works with existing files)

```
git checkout A
git checkout B f
```

This command inserts the file f of branch B in branch A 
(only works with non-existent files in A)

# Set up:

Run the following commands to init your own local bare repository in the folder
~/.cfg

```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

It's recommend to add the alias config into yout alias file
