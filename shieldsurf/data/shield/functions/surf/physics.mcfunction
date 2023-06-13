scoreboard objectives add temp dummy

execute unless block ~ ~-0.1 ~ #shield:non_solid run scoreboard players set #land temp 1

execute store result score @s vx on passengers if entity @s[type=minecart] on passengers run scoreboard players get @s vx
execute store result score @s vy on passengers if entity @s[type=minecart] on passengers run scoreboard players get @s vy
execute store result score @s vz on passengers if entity @s[type=minecart] on passengers run scoreboard players get @s vz

execute if block ~ ~-0.1 ~ #shield:low_friction run scoreboard players set .friction physics 55
execute if block ~ ~-0.1 ~ #shield:med_friction run scoreboard players set .friction physics 30
execute if block ~ ~-0.1 ~ #shield:high_friction run scoreboard players set .friction physics 10
execute unless block ~ ~-0.1 ~ #shield:has_friction run scoreboard players set .friction physics 0

execute unless predicate shield:raining run scoreboard players add .friction physics 35

execute store result score .fall temp run data get entity @s FallDistance 100
execute if score .fall temp matches ..70 run data merge entity @s {FallDistance:0.0f}


###friction

execute if score .friction physics matches 1.. run function shield:surf/friction
execute unless score .friction physics matches 1.. run scoreboard players set x0 surf.dx 0
execute unless score .friction physics matches 1.. run scoreboard players set z0 surf.dz 0

#title @p actionbar [{"score":{"name":"@s","objective":"surf.dx"}},{"text":" | "},{"score":{"name":"@s","objective":"surf.dz"}}]

scoreboard players operation #.dx temp = @s surf.dx
execute if score #.dx temp matches ..-1 run scoreboard players operation #.dx temp *= #-1 physics
execute if score #.dx temp <= .friction physics run scoreboard players set @s surf.dx 0
scoreboard players operation #.dz temp = @s surf.dz
execute if score #.dz temp matches ..-1 run scoreboard players operation #.dz temp *= #-1 physics
execute if score #.dz temp <= .friction physics run scoreboard players set @s surf.dz 0


###accelerate when downward
execute on passengers if entity @s[type=minecart] on passengers store success score #bool temp unless score @s vy matches 0
execute as @s[nbt={OnGround:1b}] if score #bool temp matches 1 unless score @s jump matches ..12 run function shield:surf/acc

##smooth rotation (and input)
execute store result score .px temp run data get entity @s Pos[0] 100.0
execute store result score .py temp run data get entity @s Pos[1] 100.0
execute store result score .pz temp run data get entity @s Pos[2] 100.0
scoreboard players set #bool temp 0
execute unless score @s surf.dx matches 0 run scoreboard players add #bool temp 1
execute unless score @s surf.dz matches 0 run scoreboard players add #bool temp 1
execute store result score .dx temp run data get entity @s Motion[0] 1000.0
execute store result score .dy temp run data get entity @s Motion[1] 1000.0
execute store result score .dz temp run data get entity @s Motion[2] 1000.0

#input
execute at @s on passengers if entity @s[type=minecart] on passengers run function shield:surf/input
#rotation
execute if score #bool temp matches 1.. at @s on passengers if entity @s[type=item_display] at @s run function shield:surf/rotate


###upward movement
#execute at @s if score #land temp matches 1 anchored eyes on passengers if entity @s[type=item_display] rotated as @s rotated ~ 0 as @e[type=silverfish,sort=nearest,limit=1] positioned ^ ^ ^1.5 unless block ~ ~ ~ #shield:non_solid if block ~ ~1 ~ #shield:non_solid run function shield:surf/up 
execute at @s if score #land temp matches 1 if score #bool temp matches 1.. anchored eyes on passengers if entity @s[type=item_display] rotated as @s rotated ~ 0 as @e[type=silverfish,sort=nearest,limit=1] positioned ^ ^ ^.5 unless block ~ ~ ~ #shield:non_solid if block ~ ~1 ~ #shield:non_solid run function shield:surf/up 


###limit speed
scoreboard players set #bool temp 0

execute if score @s surf.dx matches ..-1 if score @s surf.dx < -speed.max physics run scoreboard players add #bool temp 1
execute if score @s surf.dz matches ..-1 if score @s surf.dz < -speed.max physics run scoreboard players add #bool temp 1
execute if score @s surf.dx matches 1.. if score @s surf.dx > speed.max physics run scoreboard players add #bool temp 1
execute if score @s surf.dz matches 1.. if score @s surf.dz > speed.max physics run scoreboard players add #bool temp 1

execute if score #bool temp matches 1.. run function shield:surf/limit_speed

###update motion
scoreboard players operation @s vx *= #20 physics
scoreboard players operation @s vz *= #20 physics
execute if score @s vx matches 0 run scoreboard players operation @s surf.dx /= #5 physics
execute if score @s vz matches 0 run scoreboard players operation @s surf.dz /= #5 physics

execute if score @s surf.dz matches -60..60 if score @s surf.dx matches 0 run scoreboard players operation @s surf.dz /= #2 physics
execute if score @s surf.dx matches -60..60 if score @s surf.dz matches 0 run scoreboard players operation @s surf.dx /= #2 physics

execute store result entity @s Motion[0] double 0.001 run scoreboard players get @s surf.dx
execute store result entity @s Motion[2] double 0.001 run scoreboard players get @s surf.dz

#stop if 0
execute if score @s surf.dx matches 0 if score @s surf.dz matches 0 on passengers if entity @s[type=minecart] on passengers run function shield:surf/end

scoreboard objectives remove temp