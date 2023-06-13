execute store result score .temp x run data get entity @s Pos[0] 100.0
execute store result score .temp y run data get entity @s Pos[1] 100.0
execute store result score .temp z run data get entity @s Pos[2] 100.0


scoreboard players operation @s vx = .temp x
scoreboard players operation @s vx -= @s x

scoreboard players operation @s vy = .temp y
scoreboard players operation @s vy -= @s y

scoreboard players operation @s vz = .temp z
scoreboard players operation @s vz -= @s z


scoreboard players operation @s x = .temp x
scoreboard players operation @s y = .temp y
scoreboard players operation @s z = .temp z

#title @s actionbar [{"score":{"name":"@s","objective":"vx"}},{"text":" | "},{"score":{"name":"@s","objective":"vy"}},{"text":" | "},{"score":{"name":"@s","objective":"vz"}}]