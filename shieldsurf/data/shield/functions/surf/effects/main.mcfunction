scoreboard objectives add temp dummy

execute unless score @s surf.dx matches -150..150 run scoreboard players add #bool temp 1
execute unless score @s surf.dz matches -150..150 run scoreboard players add #bool temp 1

execute if score #bool temp matches 1.. at @s positioned over world_surface if entity @s[dy=1] on passengers if entity @s[type=item_display] at @s rotated ~ 0 run particle minecraft:ambient_entity_effect ^ ^-0.15 ^-1.35 1 1 1 1 0 force

execute if score #bool temp matches 1.. positioned over world_surface if entity @s[dy=0] positioned ~ ~-0.1 ~ if block ~ ~ ~ #minecraft:mineable/shovel run function shield:surf/effects/on_soft
execute if score #bool temp matches 1.. positioned over world_surface if entity @s[dy=0] positioned ~ ~-0.1 ~ if block ~ ~ ~ #minecraft:mineable/hoe run function shield:surf/effects/on_soft
execute if score #bool temp matches 1.. positioned over world_surface if entity @s[dy=0] positioned ~ ~-0.1 ~ if block ~ ~ ~ #minecraft:mineable/pickaxe run function shield:surf/effects/on_hard
execute if score #bool temp matches 1.. positioned over world_surface if entity @s[dy=0] positioned ~ ~-0.1 ~ if block ~ ~ ~ #minecraft:mineable/axe run function shield:surf/effects/on_hard
execute if score #bool temp matches 1.. positioned over world_surface if entity @s[dy=0] positioned ~ ~-0.1 ~ if block ~ ~ ~ #minecraft:sword_efficient run playsound minecraft:block.grass.step master @a ~ ~ ~ 0.5 1.12

scoreboard objectives remove temp