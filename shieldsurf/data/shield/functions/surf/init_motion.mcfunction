#execute if score %x temp matches ..-500 run scoreboard players set %x temp -500
#execute if score %x temp matches 500.. run scoreboard players set %x temp 500
#execute if score %z temp matches ..-500 run scoreboard players set %z temp -500
#execute if score %z temp matches 500.. run scoreboard players set %z temp 500

execute store result entity @s Motion[0] double 0.001 run scoreboard players get %x temp
data modify entity @s Motion[1] set value 0.5d
execute if score %y temp matches ..-1500 store result entity @s Motion[1] double 0.0005 run scoreboard players get %y temp
execute store result entity @s Motion[2] double 0.001 run scoreboard players get %z temp

execute store result score @s surf.dx run data get entity @s Motion[0] 1000
execute store result score @s surf.dy run data get entity @s Motion[1] 1000
execute store result score @s surf.dz run data get entity @s Motion[2] 1000

effect give @s invisibility infinite 1 true
effect give @s resistance infinite 99 true
effect give @s weakness infinite 99 true
effect give @s slowness infinite 99 true
