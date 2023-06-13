execute as @a run function shield:player_main

execute as @e[type=silverfish,tag=shield] at @s run function shield:surf/main
execute as @e[type=#shield:minecarts,tag=!invisible] run function shield:invisible_minecarts

execute if score .w wasd matches 1 run scoreboard players add .w_hold wasd 1
execute unless score .w wasd matches 1 run scoreboard players set .w_hold wasd 0