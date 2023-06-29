---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 2. Workflow

Now it's time to go through the general workflow of making games with TIC-80.

_**Note:**_ This part of the tutorial is still work in progress.

## Saving and loading

In the previous part, we created a new default cart with the command `new`. It might be a good idea to now _save_ it! That's done with the command

    save cartname.tic

After the first save we can just save the cart with plain `save` or by pressing **CTRL+S**.
And similarly, a cart is loaded with command

    load cartname.tic

(Tip: You can _autocomplete_ commands: In the previous command, you could just write `load c` and press **TAB** and TIC will complete the command!)

## TIC's file system

But where _are_ the carts?

They are inside the TIC's _data folder_, the only folder visible to TIC-80. For easy access, the folder can be revealed in Explorer with command `folder`.

You can use file system commands akin to unix to navigate and manipulate the folders and files inside the data folder:

Commands `ls` or `dir` show the contents of your current _working directory_. Folders are shown in gray inside `[brackets]`.

Move to a folder with command `cd foldername`. To go back to the _parent directory_, use command `cd ..`.

Additionally, you can use `mkdir foldername` to create a new, empty folder. Similarly, `del filename` can be used to delete files or folders. Be careful here, though!

## Adding demo carts

If there isn't any carts to see, we see the prompt

    use ADD or DEMO command to add carts

`add` copies a cart from any folder to TIC's data folder.

`demo` is a more interesting command: it adds nine _demo carts_ to the data folder.

## Carts on the TIC-80 website

A good way to see the capabilities of any tool is to see what people have made with it. So where to start?

Well, there are many carts hosted on the [TIC's website!](https://tic80.com/play)

## Commands

`help` gives the list of available commands.

`new lua` loads a new default cart. It contains a very barebones Hello World example.

`save cartname` saves the current cart as cartname.tic.

`load cartname` loads the cart named cartname.tic.

`folder`: The cartridges are stored in TIC's own data folder, you can open it in file explorer with this command.

`dir`, `ls`: See the contents of the working directory.

`run`: Play your game. You can exit the game back to command line by pressing **ESC**. 

`resume`: Resume your running game.