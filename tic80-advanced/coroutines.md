---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Coroutines 

## What are coroutines

* Couroutines are a nifty Lua feature
  * Special functions that we can jump out of
  * and then later continue execution
    * from the same line we last stopped at
* Coroutines can be used to
	* Loop through large structures one subset per frame
	* Construct cutscenes
	* Delay things

## Example: Large loops

```lua
t=0
x=96
y=24

corout = coroutine.create(function()
    for i=1,10000 do
        if i%100==0 then
            x=i/100*8
            coroutine.yield()
        end
    end
end)

function TIC()
    cls(13)
    if t%60==0 then
        coroutine.resume(corout)
    end
    spr(1+t%60//30*2,x,y,14,3,0,0,2,2)
    t=t+1
end
```