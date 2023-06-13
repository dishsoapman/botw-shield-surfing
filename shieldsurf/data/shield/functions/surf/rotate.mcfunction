execute store result entity @e[type=marker,tag=rot,limit=1] Pos[0] double 0.01 run scoreboard players operation .px temp += .dx temp 
execute store result entity @e[type=marker,tag=rot,limit=1] Pos[1] double 0.01 run scoreboard players operation .py temp += .dy temp
execute if score #land temp matches 1 store result entity @e[type=marker,tag=rot,limit=1] Pos[1] double 0.01 run data get entity @s Pos[1] 100
execute store result entity @e[type=marker,tag=rot,limit=1] Pos[2] double 0.01 run scoreboard players operation .pz temp += .dz temp
execute anchored eyes facing entity @e[type=marker,tag=rot,limit=1] eyes positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^15 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~