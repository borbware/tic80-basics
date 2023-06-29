---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Multi-file projects

In TIC-80, it's possible to split the code into multiple files for better project management.

## Using `require`

In a nutshell, you will have a single .lua TIC-80 cartridge where you include the external files with `require "relative/path/to/file"`. You can also require files in required files, but I like to keep all requires in the main cartridge.

For example, you could have `main.lua` as your main cartridge, and in the same folder, a `libraries` folder with files `math.lua` and `table.lua` inside.

Inside `main.lua`, you'd call the libraries with

```
require "libraries/math"
require "libraries/table"
```

And that's it! After the required lines, every global variable and function in those libraries is at your disposal.

NOTE: With some configurations, TIC-80's Lua hasn't found the required files from the project path automatically. Fix this by adding the following line (with the right path) to `main.lua` before the requires:

`package.path = package.path..";C:/code/myproject/?.lua"`

## Accessing cartridges outside TIC-80's own folder

By default, TIC-80 can only access cartridges inside its own folder. I like to have bigger TIC-80 projects in a git repository, so I have them inside my `C:\code` folder, which has to be accessed in a special way.

Open the folder you want to use as your working directory in command line, and run the command
```
tic80.exe --fs . --cmd="load main.lua"
```
`--fs .` means "use this folder for TIC-80 filesystem", and `--cmd="load main.lua"` loads the file `main.lua` when TIC-80 runs.

NOTE: Add TIC-80 to your system path so you can call it like above. Otherwise, you have to replace `tic80.exe` above with `path/to/tic80/tic80.exe`.

## Combining files back to one

Using multiple files works fine during development, but before exporting, you have to combine files back into one `.lua` file - this could be tedious, but it can be automated with a script. There are multiple ways to do this; I've used [Luacc](https://github.com/mihacooper/luacc).

First, you have to install Luarocks, the Lua package manager. (I strongly recommend using WSL if you're on Windows.) Installation on WSL and Ubuntu happens with the command

`sudo apt-get install -y luarocks`.

Then, install Luacc in luarocks with

`luarocks install luacc`

Then, you can run luacc with command `luacc`. Let's continue with the previous example files, and see how they are combined back into one file:

`luacc -o game.lua -p 6 -i ./ main "libraries/math" "libraries/table"`

Here, `-i ./ main` means I'm using main.lua as the base file, and `-o game.lua` denotes the output file. `-p 6` means the combined code will be inserted after the sixth line in main.lua (which is two lines after the four mandatory commented lines in a TIC cartridge). If you have more required files, you have to include them all in the script call above! This is why I like to keep all the requires in the main.lua file, so it's easier to keep track of the files.

After running this, you can export the cartridge `game.lua` normally.

## Reading

* [TIC-80 boilerplate](https://github.com/borbware/tic80-boilerplate): A multi-file project example