---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Building TIC-80

## So you want to build TIC-80 yourself

* Clone the TIC-80 repository to your code folder with
  * `git clone --recursive https://github.com/nesbox/TIC-80.git`
* ***Note:*** If you forgot to clone recursively, you have to run:
	* `git submodule update --init --recursive`

## The building process

* Building TIC-80, like most software, is a two-part process.
* First, we generate the ***Makefile***: "building instructions" for the hardware we want to build for.
* Then, we build an executable with the generated instructions
	* After making changes to code, only this part has to be done again.

## Building on Windows with MinGW

### Prerequisites

* Git (See [Git setup](project-management/0-git-setup))
* [Cmake](https://cmake.org/download/)
  * Download Windows x64 Installer
* [Ruby](https://rubyinstaller.org/downloads/)
  * Install newest version with Devkit
* These can be installed with Winget (you can't choose installation folder that way, though.)
  `winget install Git.Git Kitware.CMake RubyInstallerTeam.RubyWithDevKit.2.7`
* You also need MinGW, see the two options below.

### MinGW Option 1. MinGW bundled with Ruby

* Ruby comes with MinGW, so you might not even need to install anything extra
* `<ruby-installation-folder>\msys64\ucrt64\bin`
  * For me it was `C:\Program Files (x64)\Ruby31-x64\msys64\ucrt64\bin`
* If the folder isn't empty, add it to system path environment variables (see instructions [here](project-management/command-line-and-the-environment.md#windows-environment-variables))
* If this method fails, remove the folder from System Path, and follow MinGW option 2 (described below).

### MinGW option 2. Msys2

* Sometimes Ruby doesn't install gcc, I don't know why. Ruby is like that
* So give up with Ruby and go to [msys2.org](https://msys2.org) and download the MSYS2 installer.
  * Run the installer according to the instructions.
* If you installed MSYS2 to `C:\msys64`, the installation directory should now have a gcc executable under `C:\msys64\mingw64\bin`.
  * If not, open the MSYS2 UCRT64 terminal again.
  * Run `pacman -Syu`, and follow the prompts. The console will close.
  * Run `pacman -Syu` again.
  * Run `pacman -S --needed base-devel mingw-w64-x86_64-toolchain`. This will install the needed files.
* Add the `C:\msys64\mingw64\bin` folder to system path environment variables (see instructions [here](project-management/command-line-and-path#windows-environment-variables))

### Check that MinGW works

* To check that MinGW works for you, open a new command prompt and run `gcc --version`
  * It should output `gcc (Rev6, Built by MSYS2 project) 12.2.0` or some other version
  * If the version is 4.8, building won't be successful and you need to update your MinGW 

## Running Cmake

* Open the command line in the TIC-80 project folder (see help for Windows [here](project-management/windows-file-explorer.md#open-command-line-in-the-current-folder))
* Use `cd build` to navigate to the build folder
* Run CMake:
  * `cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel -DBUILD_SDLGPU=On -DBUILD_WITH_ALL=On ..`
  * ***Note:*** To build the pro version, include the handle `-DBUILD_PRO=On`
* This takes some time!
  * If you see `Configuring done` and `Generating done` messages, it was successful.

## Building

* Run `mingw32-make -j4`
  * The built executable should appear under `build/bin`
* ***Extra:*** To utilize all CPUs:
  ```
  $numCPUs = [Environment]::ProcessorCount
  mingw32-make "-j$numCPUs"
  ```

## Build errors

* If Cmake fails, see the `build/CMakeFiles/CMakeError.log` for clues
* Before trying CMake again, clear the cache: Remove `build/CMakeCache.txt` and the `CMakeFiles` folder.

### Mruby

```
[ 17%] Built target mruby_vendor
mingw32-make: *** [Makefile:135: all] Error 2
```
  * If `mruby` fails, you have most likely cloned your repo before mruby was added to the TIC-80 codebase.
  * Detonate the repo and start from scratch. 

### Note about cmake
  * `-- Looking for strlcat - not found`
  * Don't worry about these "not found" messages

## Creating a fork of the TIC-80 repository

* So, you want to make TIC-80 better.
* TIC-80 GitHub page: *Fork > Create a new fork*
* Clone your TIC-80 repo
* Add the original repo as a new remote:
  * `git remote add nesbox https://github.com/nesbox/TIC-80.git`

## Reading

* [Exporting a game from a custom build](https://gist.github.com/scambier/a72f8dafa1f7b9fd3ca136125a54c21b)