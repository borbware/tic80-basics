---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 1. The Default Cartridge

Download TIC-80 [here](https://tic80.com/create). For additional help, the TIC-80 [wiki start page](https://github.com/nesbox/TIC-80/wiki) is a good place to start from!

![command line view](https://user-images.githubusercontent.com/19384640/46818963-25047f00-cd8b-11e8-91f7-8042d9ef0637.gif)

## The command line

When you boot TIC-80 up, it opens in the **command line** view. Think of TIC as a tiny computer inside your computer - this is its **user interface**.

TIC-80 games are stored as **.tic files**, commonly referred to as **cartridges** or **carts**. Let's open the **default cart** by typing `new lua` and pressing enter to _execute the command_. TIC-80 responds:

```
new cart is created
```

Now the default cart is loaded! It's not empty, and we're going to need to type another command to actually _see_ what the cart actually contains. Let's execute the command `run`, which, well, _runs_ the loaded cart. Alternatively, you can just press **CTRL+R**.

---

![helloworld](https://user-images.githubusercontent.com/19384640/46818991-3e0d3000-cd8b-11e8-8972-c7596f49ccfc.gif)

There's not much: a `HELLO WORLD!` text and an animated sprite which we can move with the arrow keys.

Exit the game by pressing the ***ESC*** button.

At this point it would be nice to see _what made the cart act like it just did_. So, we're going to take a look at the **source code**!

## Source code

Press ***ESC*** to reveal the **code editor**. We can also use the shortcut button on the top left.

```Lua
-- title:  game title
-- author: game developer
-- desc:   short description
-- script: lua

t=0
x=96
y=24

function TIC()

    if btn(0) then y=y-1 end
    if btn(1) then y=y+1 end
    if btn(2) then x=x-1 end
    if btn(3) then x=x+1 end

    cls(13)
    spr(1+t%60//30*2,x,y,14,3,0,0,2,2)
    print("HELLO WORLD!",84,84)
    t=t+1
end
```

## Cart description

The code is just 21 lines, so let's go through it step by step here.

The default cart is written in Lua, which is a programming language a bit like Python. [This page](http://tylerneylon.com/a/learn-lua/) is a great introduction to Lua!

In Lua, two dashes (`--`) mark the beginning of a _one-line comment_, marked grey. Normally, comments are _disregarded_ when executing the program. HOWEVER, the first four lines of the default cart are _special comments_, in which you can write down info about your game. The fourth line tells TIC which programming language the cart is written with, let's stick with Lua for now.

```Lua
-- title:  Fantas.tic
-- author: Borb
-- desc:   An action-adventure game
-- script: lua
```

## Variables and coordinates

Then, we declare some variables and give them values. It's easy in lua:

```Lua
t=0
x=96
y=24
```

The purpose of these three fellows (or at least x and y) might become a bit clearer by changing their values. Let's change x and y to zeroes with

```Lua
x=0
y=0
```

To see what this accomplishes, we can run the cart again.

---

![xy](https://user-images.githubusercontent.com/19384640/46819001-436a7a80-cd8b-11e8-8c9e-fc3ebc82008a.gif)

The smiling sprite is now in the top-left corner! The top-left corner is indeed the _origin_, and (unlike in maths and physics) the positive values of `y` go _down_ from the origin. The bottom-right corner has the coordinates `x=240, y=136`. The _resolution_ of TIC-80 is just that, 240 by 136 pixels.

## The main loop and function declaration

Let's continue onwards! Now we get to the most important function, the **main loop** of the game, `TIC()`.

```Lua
function TIC()
    ...
end
```

`TIC()` is _called_ 60 times in a second. Here, we _declare_ it: every time it's called, TIC-80 _executes_ stuff inside. Inside it the game does its magic: we change values of some variables, draw all kinds of stuff on screen, etc.

---

All functions are declared the same way - starting with `function functionname()` and ending with `end`. For example, a sum function would be

``` lua
function sum(a,b)
    local sum = a + b
    return sum
end
```

We could then call it with, say, `sum(5,2)` and get a satisfying result of `7`.

Unlike Python, Lua doesn't necessitate the use of _indentation_, but using it produces clearer code.

## Pressing buttons and if statements

But what did we have inside `TIC()`, again?

First, there were these four lines:

```Lua
if btn(0) then y=y-1 end
if btn(1) then y=y+1 end
if btn(2) then x=x-1 end
if btn(3) then x=x+1 end
```

---

A basic _if statement_ in Lua is of the form

```Lua
if something then
    dostuff()
end
```
We could extend it with `else if` and `else`:

```Lua
if something then
    doStuff()
else if something_else then
    doOtherStuff()
else
    doCompletelyAnotherStuff()
end
```

---

But let's not get ahead of ourselves! Inside those four lines, we change the values of y and x only if a certain button is down, and the function `btn(i)` tests this.

Buttons are indexed with numbers in TIC-80:

0 means up, 1 means down, 2 means left and 3 means right. Which number denotes which button is documented in the [key map](https://github.com/nesbox/TIC-80/wiki/key-map) page, and the function `btn()` has [its own wiki page](https://github.com/nesbox/TIC-80/wiki/btn) describing how it works, like all the functions available in TIC-80 do.

## Clearing the screen and colour indices

After the button pressing lines we have this function call:

```Lua
cls(13)
```

It isn't inside any if statements, so it's called 60 times per second! The function call _clears the screen_. In other words it _paints the screen with a solid colour_. The colours, like buttons before, are indexed with numbers - we have 16 colours to use. The 13 which was seen here, corresponds to a light blue colour.

---

We could now take a slight detour to the **sprite editor** by pressing **F2**.

![sprite editor](https://user-images.githubusercontent.com/19384640/46818996-406f8a00-cd8b-11e8-8fca-6549a21ca833.gif)

The **colour palette** is located in the bottom left - and if we count from 0, light blue is number 13. We could fiddle with the pen tool and draw stuff (see our moving sprite on the right side!), but let's go back to code editor by pressing the button on the top-left corner, or **F1**.

---

So it's possible to change the background colour by changing the argument of the `cls()` function to some other number from 0 to 15. We could also remove _the function call altogether_ to get some interesting effects...

## Hello world!

After `cls()` we have a rather nasty-looking statement.

```Lua
spr(1+t%60//30_2,x,y,14,3,0,0,2,2)
```

Let's... not dive into it yet. It's easier to explain first the last two lines:

```Lua
print("HELLO WORLD!",84,84)
```
This is the [print function](https://github.com/nesbox/TIC-80/wiki/print); it just draws the white text `HELLO WORLD` to coordinates 84, 84.

## Incrementing values

Then we have

```Lua
t=t+1
```

`TIC()` gets called 60 times per second, and every time t is increased by 1. So in one second, it gets increased by 60! It tells the passage of _time_, and its units are _frames_, not _seconds_. It will provide itself useful later!

An important note: to be able to use the expression above, we have to have an _initial value_ for `t`, and at the beginning, we declared it to be `0`. In Python we could use a shorthand `t+=1`, but on Lua this isn't unfortunately possible!

## Drawing a sprite

![spriteeditor-still](https://user-images.githubusercontent.com/19384640/46818998-42394d80-cd8b-11e8-8193-2549f0e85773.gif)

### 1: The sprite memory

Now we have reached the end of the `TIC()` function, so it's time to get back to this:

```Lua
spr(1+t%60//30*2,x,y,14,3,0,0,2,2)
```

The function is `spr()`, which draws a sprite from the sprite memory to the screen, right where we want it. Let's first go with a simpler example to understand the basics: change the line to

```Lua
spr(1,x,y)
```

---

Now we get...

![spr](https://user-images.githubusercontent.com/19384640/46818993-3f3e5d00-cd8b-11e8-8239-77e3adc66dd1.gif)

So, it still draws... something? At least the sprite is still drawn in the coordinates `x` and `y`, which change as we press the directional buttons.

---

Let's take a look at the [sprite function description](https://github.com/nesbox/TIC-80/wiki/spr). It says

`spr id x y [colorkey=-1] [scale=1] [flip=0] [rotate=0] [w=1 h=1]`

This essentially means that the function is called like this:

`spr( id, x, y, colorkey, scale, flip, rotate, w, h )`

---

Mind that the arguments in `[brackets]` are optional, having their _default values_ written out in description. That's why we can just call the function with

```Lua
spr(1, x, y)
```

, like we just did! It's the same as 

```Lua
spr(1, x, y, -1, 1, 0, 0, 1, 1).
```

***Note:*** The order of arguments matters, so if you want to use the "rotate" argument, you have to include colorkey, scale and flip, too!

---

The `id `argument tells which sprite to load from memory. You can see all the sprites saved to the _sprite memory_ in **sprite editor**. It contains two sections (**FG** and **BG**, or foreground and background), each containing 256 8x8 sprites. BG contains sprites with ids 0-255 and FG 256-511. You can change between the slots by pressing **TAB**.

The only difference between FG and BG memory slots is this: we can use the sprites from the BG memory to draw the **map** in the **map editor** - more on that later! But for the spr(), we can call any sprite from BG or FG slots: just call the sprite with a number from 0 to 511.

But let's not get ahead of ourselves, let's go back to `spr()`!

### 2: Optional arguments

The function description tells that if we want to draw _multiple sprites_ with just one spr() call, we adjust the width and height arguments! If we change them both to 2 and call the function as

```Lua
spr(1, x, y, -1, 1, 0, 0, 2, 2)
```

Now we see the whole 16x16 character! We can make it bigger by changing the scale back to 3:

```Lua
spr(1, x, y, -1, 3, 0, 0, 2, 2)
```

---

Now we'd like to get rid of the yellow background. There isn't a **transparent colour** in TIC-80, so we have to deliberately _choose_ which colour will be transparent with `colorkey`. By default all colours are drawn (it's -1), so to make yellow transparent, we change it to

```Lua
spr(1, x, y, 14, 3, 0, 0, 2, 2)
```

Now everything looks like before - _almost_. The original sprite was blinking - or jumping between two animation frames. We can get the other frame of the animation by calling spr like this:

```Lua
spr(3, x, y, 14, 3, 0, 0, 2, 2)
```

### 3: Animation

The original sprite call used a clever trick to make the value jump between 1 and 3 every half seconds (or 30 frames). We can test it by printing its value in the print() function:

```Lua
print(1+t%60//30*2,84,84)
```

---

Let's break the value down:

```Lua
1+t%60//30*2
```

$\%$ is the **modulo operator**, it tells us the _remainder_ when dividing a number with another - a.k.a, it answers the question "how much was left over from the division?".

For example, we have the division $150/60 = 2.5$, whose result can be also expressed as $2,\,\mathrm{remains}\,\,30$. From this we can deduce that the corresponding modulo operation looks like this:

$
150\%60=30
$

---

And as we might remember from earlier, `t` tells _how many frames have passed_ since the beginning of the game. By using the modulo operator with number $n$ we _limit_ the values to a range between $0$ and $n - 1$:

`t%60` returns values $0,1,2,...57,58,59,0,1,2,...$

Similarly, `t%2 `returns values $0,1,0,1,0,1,...$

The modulo expression can be utilised to only return values $1$ and $3$ with

```Lua
1+t%2*2
```

---

Numbers we get from the statement above change _way too fast_ to make for a readable animation. To make it slower we use the **floor division operator**  `//`, which isn't part of regular Lua but is added to TIC-80. It's basically a _counterpart_ for the modulo operator, giving the result of division operation _without the remainder_, or in other terms _without any decimals_ that we would get from regular division:

$$
\displaylines{150/60 = 2.5 \\ 150//60 = 2}
$$

So with floor division we always get _integers_ as a result! It's indeed useful, as e.g. the _sprite ids_ are always integers.

---

So. $t\%60$ gives always numbers from $0$ to $59$, which are then operated with $//30$.

Let's denote the first part, $t\%60$, with $n$, so we can focus on the floor division $n//30$.
* If $n$ is smaller than $30$, the operation $n//30$ gives $0$.
* If $n$ is larger or equal to $30$, but under $60$, $n//30$ gives $1$.

Thus,

```Lua
t%60//30
```

jumps between $0$ and $1$ every 30 frames! 

---

To get the desired values $1$ and $3$ that our bigger 2-by-2 sprite needs, we multiply this whole thing by $2$ and add $1$:

```Lua
1+t%60//30*2
```

And that's it! The animation works just like before. And not only that - we've gone through the whole default cart.

Hopefully you now understand better how things work in TIC-80. But that was (mostly) only about the `code` editor - in the next lesson we'll get acquainted with the other ones!

See also [Part 2](https://github.com/nesbox/TIC-80/wiki/A-step-by-step-introduction-to-TIC-80,-Part-2:-Workflow) of this tutorial.