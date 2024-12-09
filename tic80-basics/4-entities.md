---
marp: true
paginate: true
theme: borbtheme
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

## Entities

* Games usually consist of entities
  * In Godot, they are Nodes - in Unity, they are called GameObjects
* In TIC-80, we need to create some sort of entity system ourselves.
* Lua's tables can serve as entities
* We don't need classes from object-oriented programming, but the concept of wrapping entity data inside an object (or in our case, a Lua table) is helpful

## Entity skeleton

```lua
entity={
    x=0,y=0,
    w=8,h=8,
    init=function(ent)
        to(entities,ent)
    end,
    upd=function(ent)
        ...
    end,
    drw=function(ent)
        ...
    end,
}
entity:init()--add the one entity to the entity table
```

### Entity insides

* Above, we have an empty entity with position (`x`, `y`), width and height (`w`, `h`), and ***three functions***
  * `init` is called when the entity is initialized
    * We add the entity to the global `entities` table here
  * `upd` is used to update the entity
    * Change position, calculate collision, etc.
  * `drw` is used to draw the entity.
* All these functions take in one argument: The table itself.

## Main loop

* With these entities, we can create a simple main loop
    ```lua
    function TIC()
        for i,ent in ipairs(entities)do--update all entities
            ent:upd()
        end
        for i,ent in ipairs(entities)do--draw all entities
            ent:drw()
        end
    end
    ```

## Create multiple entities easily

* If you want to create easily multiple entities (like enemies, bullets, etc), create a function where you can do that:
    ```lua
    function newEntity()
        local entity={
            x=0,y=0,
            w=8,h=8,
            init=function(ent)
                to(entities,ent)
            end,
            upd=function(ent)
                ...
            end,
            drw=function(ent)
                ...
            end,
        }
        entity:init()
    end
    ```

## Spawn entities based on specific tiles on the map

* WIP