---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Camera

* TIC-80 doesn't have a built-in camera system, so you have to implement it yourself
* Here's my way of doing it
* Create a camera table:
	```lua
	cam={
		x=0,
		y=0,
	}
	```
* `cam.x` and `cam.y` tell the position of the upper left corner of the camera

## Drawing entities

* For every entity you want to draw with respect to the camera position...
  * When drawing the entity on screen, subtract camera coordinates from the entity position like this:
	```lua
	spr(player.id, player.x-cam.x, player.y-cam.y)
	```

## Drawing the map

* Drawing the map with respect to camera coordinates is a bit tricky in TIC-80
* unlike, say, `spr()`, the `map()` function does not take in the exact coordinates where we want to draw the map
* Let's focus on the first six parameters of `map(x,y,w,h,sx,sh)`:
  * `x` and `y` are not at all the same as the `x` and `y` parameters for `spr(id,x,y)`!
    * They're the top-left-most cell of the map we want to draw.
    * (We only want to draw a small portion of the map at once!)
  * `w` and `h` (width and height, in cells) tell how many cells of the map we want to draw on screen.
  * `sx` and `sy` are the same as `x` and `y` parameters for `spr()`:
    * The screen coordinates where we want to draw the map.

### Drawing the map with respect to the camera

* We can account for the camera position if we draw the map on screen like this:
	```lua
	map(cam.x//8, cam.y//8, 31,18, -(cam.x%8), -(cam.y%8))
	```

## Moving the camera

* We can add an update method for the `cam` entity and update it in the main loop.
  * For instance, if we want the camera to center on the player:

	```lua
	cam={
		x=0,
		y=0,
		w=240,
		h=136
		upd=function(cam)
			cam.x,cam.y=
				player.x+player.w/2-cam.w/2,
				player.y+player.h/2-cam.h/2
		end,
	}
	```

### Calling `cam.upd()`

* I usually don't add special entities like camera to the `entities` table, and instead call their methods directly:

```lua
function TIC()
	for i,ent in ipairs(entities)do
		ent:upd()
	end
	cam:upd()
	for i,ent in ipairs(entities)do
		ent:drw()
	end
end
```