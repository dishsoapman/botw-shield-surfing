execute if score .a wasd matches 1.. on passengers if entity @s[type=item_display] at @s run tp @s ~ ~ ~ ~-5 ~
execute if score .d wasd matches 1.. on passengers if entity @s[type=item_display] at @s run tp @s ~ ~ ~ ~5 ~
#execute if score #land temp matches 1 on passengers if entity @s[type=item_display] at @s anchored eyes rotated ~ 0 positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^15 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~

#get angle
execute on passengers if entity @s[type=item_display] store result score .angle temp run data get entity @s Rotation[0] 1.0

###get speed
scoreboard players operation .dx temp = @s surf.dx
scoreboard players operation .dz temp = @s surf.dz

#square x
scoreboard players operation .dx temp *= .dx temp

#square z
scoreboard players operation .dz temp *= .dz temp

#add and sqrt
scoreboard players operation .dx temp /= #100 physics
scoreboard players operation .dz temp /= #100 physics

scoreboard players operation .dx temp += .dz temp
scoreboard players operation in math = .dx temp

function math:root

scoreboard players operation out math /= #100 physics
scoreboard players operation .speed temp = out math
scoreboard players operation .speed0 temp = out math

#tellraw @p [{"score":{"name":".speed","objective":"temp"}}]

###x = speed * cos(angle)
scoreboard players operation in math = .angle temp
function math:trig/cos

execute unless score .speed temp matches 0 run scoreboard players operation .speed temp *= out math
#tellraw @p [{"score":{"name":".speed","objective":"temp"}}]


###z = speed * sin(angle)
scoreboard players operation in math = .angle temp
function math:trig/sin

execute unless score .speed0 temp matches 0 run scoreboard players operation .speed0 temp *= out math

#tellraw @p [{"score":{"name":".speed0","objective":"temp"}}]

#add
scoreboard players operation .dx temp = @s surf.dx
scoreboard players operation .dz temp = @s surf.dz

scoreboard players operation .dx temp *= #1000 physics
scoreboard players operation .dz temp *= #1000 physics

execute if score .a wasd matches 1.. run scoreboard players operation .dx temp += .speed temp
execute if score .a wasd matches 1.. run scoreboard players operation .dz temp += .speed0 temp
execute if score .d wasd matches 1.. run scoreboard players operation .dx temp -= .speed temp
execute if score .d wasd matches 1.. run scoreboard players operation .dz temp -= .speed0 temp

#tellraw @p [{"score":{"name":".dx","objective":"temp"}}]
#tellraw @p [{"score":{"name":".dz","objective":"temp"}}]

scoreboard players operation .dx temp /= #1000 physics
scoreboard players operation .dz temp /= #1000 physics


scoreboard players operation @s surf.dx = .dx temp
scoreboard players operation @s surf.dz = .dz temp

