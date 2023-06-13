
function shield:get_speed
scoreboard players add @s shield_id 0

execute unless score @s shield_id matches 1.. run function shield:assign_id

execute as @s[scores={drop_shield=1..}] at @s run function shield:shield_check
execute as @s[scores={blocking=1..}] at @s run scoreboard players set @s blocking 0

execute as @s[tag=surf] at @s unless predicate shield:on_shield run function shield:surf/end
