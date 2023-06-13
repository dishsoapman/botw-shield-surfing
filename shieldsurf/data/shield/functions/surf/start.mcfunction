tag @s add this
tag @s add surf

execute at @s as @e[type=item,nbt={Item:{id:"minecraft:shield",Count:1b}},distance=..5] at @s on origin if entity @s[tag=this] run tag @e[type=item,sort=nearest,limit=1] add this_item

execute at @s unless entity @e[type=marker,tag=rot] run summon marker ~ ~ ~ {Tags:["rot"]}

summon minecraft:silverfish ~ ~ ~ {Tags:["shield","root","new"],Silent:1b,PersistenceRequired:1b,Invulnerable:1b}
summon minecraft:minecart ~ ~ ~ {Tags:["shield","cart","invisible","new"],Silent:1b,PersistenceRequired:1b,Invulnerable:1b}
summon minecraft:item_display ~ ~ ~ {Tags:["shield","display","new"],item:{id:"minecraft:shield",Count:1},item_display:thirdperson_righthand,interpolation_duration:0,start_interpolation:0,transformation:[0.000f, 0.000f, 1.000f,0.250f,1.000f, 0.000f, 0.000f,0.025f,0.000f, 1.000f, 0.000f,0.125f,0.000f, 0.000f, 0.000f,1.000f]}
execute as @e[type=item,tag=this_item] at @s as @e[type=item_display,tag=new] run data modify entity @s item set from entity @e[type=item,sort=nearest,limit=1] Item
kill @e[type=item,tag=this_item]

scoreboard players operation @e[tag=new] shield_id = @s shield_id
execute as @e[tag=!root,tag=!this,tag=new] run ride @s mount @e[type=silverfish,tag=new,limit=1]
data modify entity @e[type=silverfish,tag=new,limit=1] FallDistance set from entity @s FallDistance
data modify entity @e[type=item_display,tag=new,limit=1] Rotation[0] set from entity @s Rotation[0]
ride @s mount @e[type=minecart,tag=new,limit=1]


scoreboard players set %x temp 20
scoreboard players set %y temp 20
scoreboard players set %z temp 20

scoreboard players operation %x temp *= @s vx
scoreboard players operation %y temp *= @s vy
scoreboard players operation %z temp *= @s vz

execute as @e[type=silverfish,tag=new] run function shield:surf/init_motion


tag @e[tag=new] remove new
tag @s remove this

playsound minecraft:item.armor.equip_iron master @a ~ ~ ~ 1 2
playsound minecraft:ui.toast.out master @a ~ ~ ~ 1.5 0.85