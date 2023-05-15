---
title: Project management. Command line and the environment
marp: true
paginate: true
theme: borbtheme
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Windows File Explorer tips

## View settings

* In the file explorer, open the *View* tab and check these two boxes:
  * ✅ File name extensions
    * to see the types of the files
  * ✅ Hidden items
    *	otherwise you can't see the .git folder, for instance

## Open command line in the current folder

* To open the command line in the currently open folder:
* Click the empty section in the address bar to see the path to your current folder
* Replace the address with the text `cmd` and press ***ENTER***
* Similarly, you can write `powershell` to run the PowerShell console in the directory.

## Open project folder with VS Code

* *Right click > Open with Code*
  * If you chose this option during the VS code installation, you can open folders in VS code by right-clicking them
  * If you don't see the option, you can open the command line and run 
    ```
    code .
    ```