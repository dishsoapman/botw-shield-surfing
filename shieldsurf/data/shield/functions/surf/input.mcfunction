#get player input
function wasd:mounted

scoreboard players operation #bool math += .a wasd
scoreboard players operation #bool math += .d wasd

execute if score #bool math matches 1.. on vehicle on vehicle at @s positioned over world_surface if entity @s[dy=2] run function shield:surf/steer

execute if score #land temp matches 1.. if score .w wasd matches 1.. if score .w_hold wasd matches 1..3 on vehicle on vehicle at @s run function shield:surf/jump
execute if score #land temp matches 1.. if score .s wasd matches 1.. on vehicle on vehicle run function shield:surf/limit_speed