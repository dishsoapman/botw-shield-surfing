execute if block ~ ~ ~ #minecraft:dirt run playsound minecraft:block.grass.step master @a ~ ~ ~ 0.5 0.89
execute if block ~ ~ ~ #minecraft:snow run playsound minecraft:block.snow.step master @a ~ ~ ~ 0.5 1
execute unless block ~ ~ ~ #minecraft:dirt unless block ~ ~ ~ #minecraft:snow run playsound minecraft:block.grass.step master @a ~ ~ ~ 0.5 0.98
