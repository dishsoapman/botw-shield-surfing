scoreboard players operation alpha temp = .friction physics

execute if score x0 surf.dx matches 0 run scoreboard players operation x0 surf.dx = @s surf.dx
execute if score z0 surf.dz matches 0 run scoreboard players operation z0 surf.dz = @s surf.dz

execute if score x0 surf.dx matches ..-1 run scoreboard players operation x0 surf.dx *= #-1 physics
execute if score z0 surf.dz matches ..-1 run scoreboard players operation z0 surf.dz *= #-1 physics

scoreboard players operation x0 surf.dx /= alpha temp
scoreboard players operation z0 surf.dz /= alpha temp

execute if score @s surf.dx matches 1.. run scoreboard players operation @s surf.dx -= x0 surf.dx
execute if score @s surf.dz matches 1.. run scoreboard players operation @s surf.dz -= z0 surf.dz
execute if score @s surf.dx matches ..-1 run scoreboard players operation @s surf.dx += x0 surf.dx
execute if score @s surf.dz matches ..-1 run scoreboard players operation @s surf.dz += z0 surf.dz