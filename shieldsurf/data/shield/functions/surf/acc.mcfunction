scoreboard players operation .x temp = @s surf.dx
execute on passengers if entity @s[type=minecart] on passengers store result score .y temp run scoreboard players get @s vy
execute if score .y temp matches 1.. run scoreboard players set .y temp 0
#scoreboard players operation .y temp *= #-1 physics
scoreboard players operation .y temp *= #20 physics

execute store result score .yx temp run scoreboard players operation .yz temp = .y temp
scoreboard players operation .z temp = @s surf.dz

#get angle of impact 0-180
execute on passengers if entity @s[type=item_display] store result score .angle temp run data get entity @s Rotation[1]
scoreboard players operation .angle temp += #90 physics
execute store result score .angle temp run scoreboard players operation #180 physics -= .angle temp
scoreboard players set #180 physics 180

#vx * sin(angle of impact) * cos(angle)
scoreboard players operation in math = .angle temp
function math:trig/sin
scoreboard players operation sin temp = out math
scoreboard players operation in math = .angle temp
function math:trig/cos
scoreboard players operation sin temp *= out math
scoreboard players operation .yx temp *= sin temp
scoreboard players operation .yx temp /= #1000 physics
#tellraw @p [{"score":{"name":".yx","objective":"temp"}}]

execute if score .yx temp matches ..-1 run scoreboard players operation .yx temp *= #-1 physics

#vz * cos(angle of impact) * cos(angle)
scoreboard players operation in math = .angle temp
function math:trig/cos
scoreboard players operation cos temp = out math
scoreboard players operation in math = .angle temp
function math:trig/cos
scoreboard players operation cos temp *= out math
scoreboard players operation .yz temp *= cos temp
scoreboard players operation .yz temp /= #1000 physics
execute if score .yz temp matches ..-1 run scoreboard players operation .yz temp *= #-1 physics

scoreboard players operation .x temp *= #1000 physics
scoreboard players operation .z temp *= #1000 physics

execute if score .x temp matches 5.. run scoreboard players operation .x temp += .yx temp
execute if score .z temp matches 5.. run scoreboard players operation .z temp += .yz temp
execute if score .x temp matches ..-5 run scoreboard players operation .x temp -= .yx temp
execute if score .z temp matches ..-5 run scoreboard players operation .z temp -= .yz temp

scoreboard players operation .x temp /= #1000 physics
scoreboard players operation .z temp /= #1000 physics

scoreboard players operation @s surf.dx = .x temp
scoreboard players operation @s surf.dz = .z temp

