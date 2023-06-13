execute as @p at @s as @e[type=item_display] if score @s shield_id = @p shield_id run tag @s add this
data modify entity @s data.item set from entity @e[type=item_display,tag=this,limit=1] item

execute at @p run summon item ~ ~ ~ {Tags:["new"],PickupDelay:0,Item:{id:"minecraft:oak_button",Count:1b}}
data modify entity @e[type=item,tag=new,limit=1] Owner set from entity @p UUID
data modify entity @e[type=item,tag=new,limit=1] Item set from entity @s data.item

kill @s
