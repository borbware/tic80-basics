---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Entities

* Games usually consist of entities
  * In Godot, they are Nodes - in Unity, they are called GameObjects
* In TIC-80, we need to create some sort of entity system ourselves.

# Entity skeleton

```lua
entity={
	x=0,
	y=0,
	w=8,
	h=8,
	init=function(ent)
		to(entities,ent)
	end,
	upd=function(ent)

	end,
	drw=function(ent)

	end,
}
```

# Main loop

```lua
function TIC()
	for i,ent in ipairs(entities)do
		ent:upd()
	end
	for i,ent in ipairs(entities)do
		ent:drw()
	end
end
```


