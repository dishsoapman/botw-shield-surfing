execute on passengers if entity @s[type=player] run tag @s add this

execute at @s rotated as @a[tag=this] rotated ~ 0 run tp @e[type=marker,tag=rot,limit=1] ~ ~ ~ ~ ~

execute store result score .x1 temp run data get entity @s Pos[0] 1000
execute store result score .z1 temp run data get entity @s Pos[2] 1000

execute as @e[type=marker,tag=rot,limit=1] at @s rotated as @a[tag=this] rotated ~ 0 run tp @s ^ ^ ^0.01 ~ ~

execute store result score .x2 temp run data get entity @e[type=marker,tag=rot,limit=1] Pos[0] 1000
execute store result score .z2 temp run data get entity @e[type=marker,tag=rot,limit=1] Pos[2] 1000

scoreboard players operation .x2 temp -= .x1 temp
scoreboard players operation .z2 temp -= .z1 temp

execute store result score .mx temp run data get entity @s Motion[0] 1000
execute store result score .mz temp run data get entity @s Motion[2] 1000

execute store result entity @s Motion[0] double 0.001 run scoreboard players operation .mx temp += .x2 temp
execute store result entity @s Motion[2] double 0.001 run scoreboard players operation .mz temp += .z2 temp

tag @a[tag=this] remove this