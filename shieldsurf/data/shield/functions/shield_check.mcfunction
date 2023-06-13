scoreboard players set @s drop_shield 0
scoreboard objectives add temp dummy

execute at @s if block ~ ~-0.5 ~ #shield:non_solid if predicate shield:sprint if score @s blocking matches 1.. run function shield:surf/start


scoreboard players set @s blocking 0
scoreboard objectives remove temp