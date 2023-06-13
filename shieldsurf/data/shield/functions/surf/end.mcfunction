#execute at @s as @e[type=item_display,tag=shield] if score @s shield_id = @p shield_id run item replace entity @p weapon from entity @s container.0
execute at @s summon marker run function shield:surf/return_shield

execute at @s as @e[tag=shield,type=!silverfish] if score @s shield_id = @p shield_id run kill @s
execute at @s as @e[tag=shield,type=silverfish] if score @s shield_id = @p shield_id run tp @s ~ -1000 ~

tag @s remove surf