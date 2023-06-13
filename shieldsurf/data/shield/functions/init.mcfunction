tellraw @a "Loaded!"

scoreboard objectives add drop_shield minecraft.dropped:minecraft.shield
scoreboard objectives add blocking dummy
scoreboard objectives add shield_id dummy

scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy

scoreboard objectives add vx dummy
scoreboard objectives add vy dummy
scoreboard objectives add vz dummy

scoreboard objectives add surf.dx dummy
scoreboard objectives add surf.dy dummy
scoreboard objectives add surf.dz dummy

scoreboard players add x0 surf.dx 0
scoreboard players add z0 surf.dz 0

scoreboard objectives add jump dummy

scoreboard objectives add physics dummy
scoreboard players set .friction physics 5

scoreboard players set #-100 physics -100
scoreboard players set #-1 physics -1
scoreboard players set #2 physics 2
scoreboard players set #3 physics 3
scoreboard players set #4 physics 4
scoreboard players set #5 physics 5
scoreboard players set #6 physics 6
scoreboard players set #10 physics 10
scoreboard players set #20 physics 20
scoreboard players set #60 physics 60
scoreboard players set #90 physics 90
scoreboard players set #100 physics 100
scoreboard players set #180 physics 180
scoreboard players set #360 physics 360
scoreboard players set #500 physics 500
scoreboard players set #1000 physics 1000
scoreboard players set #10000 physics 10000
scoreboard players set #100000 physics 100000

scoreboard players set speed.max physics 500
scoreboard players set -speed.max physics -500
