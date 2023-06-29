---
title: Git cheat sheet
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Git cheat sheet

## Uploading a new Unity project to GitHub

Initialize Git in the Unity project folder, pull the `.gitignore` file, make your first commit and push:

`git init`

`git remote add origin [remote-url]`

`git pull origin main`

`git add .`

`git commit -m "first commit"`

`git push --set-upstream origin main`

## Common workflow

`git status`

`git add filename`

`git commit -m "make change"`

`git pull` (If working in a team, always pull before pushing!)

`git push`

## Creating a new branch

`git checkout -b newBranch`

* This is a shorthand for `git branch newBranch && git checkout newBranch`

`git add newFile.txt`

`git commit -m "add newFile.txt"`

`git push --set-upstream origin newBranch`

* (The line above creates a new remote branch. After doing it once, you can just use regular git push)

## Merging a feature branch to master

`git checkout master`

`git merge newBranch`

* This is where the conflicts happen. Fix them in VS code

`git add conflictedFile.txt`

`git commit`

`git push`

## Merging changes from master to feature branch

* On feature branch:
  `git fetch origin master:master`

  `git merge master`


## Reading

* [GitHub cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)