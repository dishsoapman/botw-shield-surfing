function shield:surf/physics
function shield:surf/effects/main

execute at @s if block ~ ~ ~ water on passengers if entity @s[type=minecart] on passengers run function shield:surf/end

execute as @s[tag=jump] run scoreboard players add @s jump 1
execute at @s[tag=jump] if score @s jump matches 2.. unless block ~ ~-0.1 ~ #shield:non_solid run tag @s remove jump
execute if score @s jump matches 2.. unless block ~ ~-0.1 ~ #shield:non_solid run scoreboard players set @s jump 0
