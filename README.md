This repo contains most of my dot files, which otherwise would be a pain in the
ass to share and synchronize between machines.


# Todo:

* [ ] Assign applications to workspaces
* [ ] Learn more about basic tools of bspwm
* [ ] Make applications floating

* [ ] Open things on click in polybar
* [ ] If not possible think of new keybindings where to put
* [ ] Keyboard toggle script
* [ ] Add music widget in polybar
* [ ] Add weather widget in polybar



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
