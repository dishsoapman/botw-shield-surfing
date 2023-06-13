scoreboard players operation .x temp = @s surf.dx
scoreboard players operation .z temp = @s surf.dz

scoreboard players operation .x temp /= #10 physics
scoreboard players operation .z temp /= #10 physics

scoreboard players operation @s surf.dx -= .x temp
scoreboard players operation @s surf.dz -= .z temp

execute if score .s wasd matches 1.. on passengers if entity @s[type=item_display] at @s run particle block dirt ^ ^-0.1 ^0.5 0.25 0 0.25 0 5 force
execute if score .s wasd matches 1.. at @s run playsound minecraft:item.shovel.flatten master @a ~ ~ ~ 0.5 0.75