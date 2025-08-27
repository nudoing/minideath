
summon falling_block ~ ~ ~ {BlockState:{Name:"barrel"},CancelDrop:true}

summon armor_stand ~ ~ ~ {Invulnerable:true}

data modify entity @e[type=minecraft:armor_stand,sort=nearest,limit=1] Invulnerable set value true

