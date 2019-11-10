> This repo contains most of my dot files, which otherwise would be a pain in the
> ass to share synchronize between machines.


#Todo:

* [ ] Add dot files which should be the same on both machines to master branch
* [ ] Merge master branch into laptop and tower branch
* [ ] Add machine specific files to the corresponding branches


#Usefule git commands:

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