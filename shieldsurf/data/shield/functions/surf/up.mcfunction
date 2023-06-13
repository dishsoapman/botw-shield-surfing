scoreboard players operation .vx temp = @s surf.dx
scoreboard players operation .vz temp = @s surf.dz
execute if block ~ ~ ~ #minecraft:slabs run scoreboard players set .angle temp 225
execute if block ~ ~ ~ #minecraft:stairs run scoreboard players set .angle temp 450
execute unless block ~ ~ ~ #shield:angled run scoreboard players set .angle temp 750

#square x
scoreboard players operation .vx temp *= .vx temp

#square z
scoreboard players operation .vz temp *= .vz temp

#add and sqrt
scoreboard players operation .vx temp /= #100 physics
scoreboard players operation .vz temp /= #100 physics

scoreboard players operation .vx temp += .vz temp
scoreboard players operation in math = .vx temp

function math:root

scoreboard players operation .hv temp = out math

#vy = hv * sin(incline angle)
scoreboard players operation in math = .angle temp

function math:trig/sin

scoreboard players operation .hv temp *= out math
execute if score .hv temp matches ..-1 run scoreboard players operation .hv temp *= #-1 physics

#tellraw @p [{"score":{"name":".hv","objective":"temp"}}]


execute store result entity @s Motion[1] double 0.0000000999 run scoreboard players get .hv temp

#reduce forward motion
scoreboard players operation .x temp = @s surf.dx
scoreboard players operation .z temp = @s surf.dz

scoreboard players operation .x temp /= #5 physics
scoreboard players operation .z temp /= #5 physics

scoreboard players operation @s surf.dx -= .x temp
scoreboard players operation @s surf.dz -= .z temp