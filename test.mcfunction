#メモ用functionファイル







#$damage @s $(test)



summon minecraft:item_display ~ ~ ~ {item:{id:sunflower,components:{custom_model_data:1}},transformation:{left_rotation:{angle:0,axis:[1,0,0]},right_rotation:{angle:300,axis:[1,0,0]},translation:[0,0,0],scale:[10,10,10]},interpolation_duration:500,start_interpolation:0}

summon item_display ~ ~ ~ {item:{id:pufferfish},Tags:["kingyo"]}


#summon minecraft:item_display ~ ~ ~ {item:{id:"player_head"},Tags:["head"],transformation:}


#summon chest_minecart ~ ~ ~ {CustomDisplayTile:1b,DisplayOffset:16,DisplayState:{Name:"minecraft:player_head",Properties:{profile:'{name:nudon}'}}}


summon chest_minecart ~ ~ ~ {CustomDisplayTile:1b,DisplayOffset:16,DisplayState:{Name:chest}}

setblock ~ ~ ~ player_head{profile:{name:nudon}}


summon item_display ~ ~ ~ {item:{id:player_head,components:{profile:{name:nudon}}},Tags:["head"],transformation:{right_rotation:[0f,0f,0f,1f],scale:[1,1,1],left_rotation:[0f,0f,0f,1f],translation:[0f,1.4f,0f]}}


give @s player_head[profile={name:CINDY2525}]

summon chest_minecart ~ ~ ~ {CustomDisplayTile:1b}



summon chest_minecart ~ ~ ~ {CustomDisplayTile:true,DisplayState:{Name:"air"}}

summon item_display ~ ~ ~ {item:{id:player_head,components:{profile:{name:nudon}}},Tags:["head"],transformation:{right_rotation:{angle:1.57f,axis:[0,1,0]},scale:[1,1,1],left_rotation:[0f,0f,0f,1f],translation:[0f,0.8f,0f]}}


data modify entity @e[limit=1,type=minecraft:item_display,tag=head] Rotation set from entity @e[type=minecraft:chest_minecart,limit=1] Rotation


summon llama ~ ~ ~ {ChestedHorse:1b}



summon minecraft:chest_minecart ~ ~ ~ {CustomName:'"あいうえお"'}


give @s potion[custom_name='"あかるくみえる！"',potion_contents={potion:"water",custom_effects:[{id:night_vision,show_icon:false,show_particles:false,duration:-1}]},max_stack_size=99]

give @s milk_bucket[max_stack_size=99]




give @s bundle[bundle_contents=[{id:"acacia_planks",count:99}]]

