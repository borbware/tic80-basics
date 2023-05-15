---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 3. TIC-80 API

## API?

* API, or *Application Programming Interface* refers the way we interact with an application
  * in TIC-80's case, its the set of functions provided with the fantasy computer
  * TIC-80 wiki: [API](https://github.com/nesbox/TIC-80/wiki/API)


### Basics


* [TIC](https://github.com/nesbox/TIC-80/wiki/TIC)
	* Callback function for the main loop. Called once per frame, 60 times per second
* System
  * [trace](https://github.com/nesbox/TIC-80/wiki/trace): Print to console "`Debug.Log`"
  * [time](https://github.com/nesbox/TIC-80/wiki/time): Get time passed after the game started
  * [reset](https://github.com/nesbox/TIC-80/wiki/reset): Reset the game
### Drawing
* [cls](https://github.com/nesbox/TIC-80/wiki/cls): Clear screen
* [print](https://github.com/nesbox/TIC-80/wiki/print): Print text
* [spr](https://github.com/nesbox/TIC-80/wiki/spr): Draw sprite
* [pix](https://github.com/nesbox/TIC-80/wiki/pix): Draw a pixel
* [line](https://github.com/nesbox/TIC-80/wiki/line): Draw a line
* [map](https://github.com/nesbox/TIC-80/wiki/map): Draw tilemap
* [circ](https://github.com/nesbox/TIC-80/wiki/circ) & [circb](https://github.com/nesbox/TIC-80/wiki/circb): Circle & Circle border
* [tri](https://github.com/nesbox/TIC-80/wiki/tri), [ttri](https://github.com/nesbox/TIC-80/wiki/ttri) & [trib](https://github.com/nesbox/TIC-80/wiki/trib): Triangle, Textured triangle & Triangle border
* [rect](https://github.com/nesbox/TIC-80/wiki/rect) & [rectb](https://github.com/nesbox/TIC-80/wiki/rectb): Rectangle & Rectangle border
### Input

* Controller & keyboard (by default, ABXY buttons are mapped to ZXAS keys)
  * 0,1,2,3,4,5,6,7: up, down, left, right, A, B, X, Y
  * See [Keymap](https://github.com/nesbox/TIC-80/wiki/key-map) for the rest (multiplayer for up to 4 controllers supported!)
  * [btn](https://github.com/nesbox/TIC-80/wiki/btn): Get continuous input. "`GetButton`"
  * [btnp](https://github.com/nesbox/TIC-80/wiki/btnp): Get input for only one frame. "`GetButtonDown`"
* [key](https://github.com/nesbox/TIC-80/wiki/key) & [keyp](https://github.com/nesbox/TIC-80/wiki/keyp): Get input from keyboard "`GetKey`" & "`GetKeyDown`"
  * [Keyboard keycodes](https://github.com/nesbox/TIC-80/wiki/key)
* [mouse](https://github.com/nesbox/TIC-80/wiki/mouse): Mouse input

### Sound

* [sfx](https://github.com/nesbox/TIC-80/wiki/sfx): Play a sound effect
* [music](https://github.com/nesbox/TIC-80/wiki/music): Play music

### Memory

* [mget](https://github.com/nesbox/TIC-80/wiki/mget) & [mset](https://github.com/nesbox/TIC-80/wiki/mset): Get & set tile in tile map
* [fget](https://github.com/nesbox/TIC-80/wiki/fget) & [fset](https://github.com/nesbox/TIC-80/wiki/fset): Get & set sprite flag
* [pmem](https://github.com/nesbox/TIC-80/wiki/pmem): Get or set value in persistent memory (load & save!)
* [peek*](https://github.com/nesbox/TIC-80/wiki/peek) & [poke*](https://github.com/nesbox/TIC-80/wiki/poke): manipulate internal RAM & VRAM
  * [Memory layout](https://github.com/nesbox/TIC-80/wiki/RAM)
### Tricks

* [BDR](https://github.com/nesbox/TIC-80/wiki/BDR)
  * Callback function for drawing or manipulating stuff between every "scanline", plus border
  * Called 143 times per frame 
* [Manipulating the color palette](https://github.com/nesbox/TIC-80/wiki/palette)
* [More graphics with less colors: bits per pixel](https://github.com/nesbox/TIC-80/wiki/Bits-Per-Pixel)

