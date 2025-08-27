# 死亡時実行

#他データパックの死亡処理をまず行う
function #minideath:death


# 持ってたアイテム一覧保存用ストレージの準備
data modify storage minideath:work death1 set value []
data modify storage minideath:work death2 set value []

# 死亡時落としたアイテムそれぞれに処理させる。 (準備したストレージに自分自身を追加)
execute as @e[type=item,distance=..4] if data entity @s {Age:0s} run function minideath:death/asitems

# ストレージ上のデータにスロット番号を付け加える
data modify storage minideath:work death1[0] merge value {Slot:0}
data modify storage minideath:work death1[1] merge value {Slot:1}
data modify storage minideath:work death1[2] merge value {Slot:2}
data modify storage minideath:work death1[3] merge value {Slot:3}
data modify storage minideath:work death1[4] merge value {Slot:4}
data modify storage minideath:work death1[5] merge value {Slot:5}
data modify storage minideath:work death1[6] merge value {Slot:6}
data modify storage minideath:work death1[7] merge value {Slot:7}
data modify storage minideath:work death1[8] merge value {Slot:8}
data modify storage minideath:work death1[9] merge value {Slot:9}
data modify storage minideath:work death1[10] merge value {Slot:10}
data modify storage minideath:work death1[11] merge value {Slot:11}
data modify storage minideath:work death1[12] merge value {Slot:12}
data modify storage minideath:work death1[13] merge value {Slot:13}
data modify storage minideath:work death1[14] merge value {Slot:14}
data modify storage minideath:work death1[15] merge value {Slot:15}
data modify storage minideath:work death1[16] merge value {Slot:16}
data modify storage minideath:work death1[17] merge value {Slot:17}
data modify storage minideath:work death1[18] merge value {Slot:18}
data modify storage minideath:work death1[19] merge value {Slot:19}
data modify storage minideath:work death1[20] merge value {Slot:20}
data modify storage minideath:work death1[21] merge value {Slot:21}
data modify storage minideath:work death1[22] merge value {Slot:22}
data modify storage minideath:work death1[23] merge value {Slot:23}
data modify storage minideath:work death1[24] merge value {Slot:24}
data modify storage minideath:work death1[25] merge value {Slot:25}
data modify storage minideath:work death1[26] merge value {Slot:26}

data modify storage minideath:work death2[0] merge value {Slot:0}
data modify storage minideath:work death2[1] merge value {Slot:1}
data modify storage minideath:work death2[2] merge value {Slot:2}
data modify storage minideath:work death2[3] merge value {Slot:3}
data modify storage minideath:work death2[4] merge value {Slot:4}
data modify storage minideath:work death2[5] merge value {Slot:5}
data modify storage minideath:work death2[6] merge value {Slot:6}
data modify storage minideath:work death2[7] merge value {Slot:7}
data modify storage minideath:work death2[8] merge value {Slot:8}
data modify storage minideath:work death2[9] merge value {Slot:9}
data modify storage minideath:work death2[10] merge value {Slot:10}
data modify storage minideath:work death2[11] merge value {Slot:11}
data modify storage minideath:work death2[12] merge value {Slot:12}
data modify storage minideath:work death2[13] merge value {Slot:13}
data modify storage minideath:work death2[14] merge value {Slot:14}
data modify storage minideath:work death2[15] merge value {Slot:15}


# 収納用チェストカートを召喚
summon chest_minecart ~ ~1 ~ {Tags:["md_entity","md_now","id1"],DisplayState:{Name:"barrier"},Invulnerable:true}


# 1つで入り切らないなら2つ目も
execute if data storage minideath:work death2[0] run summon chest_minecart ~ ~ ~ {Tags:["md_entity","md_now","id2"],DisplayState:{Name:"barrier"},Invulnerable:true}

# ストレージ上のアイテムデータをチェストカートに入れる
data modify entity @e[type=minecraft:chest_minecart,limit=1,tag=md_now,tag=id1,sort=nearest] Items set from storage minideath:work death1
data modify entity @e[type=minecraft:chest_minecart,limit=1,tag=md_now,tag=id2,sort=nearest] Items set from storage minideath:work death2


#プレイヤー頭のデータを準備する
loot spawn ~ ~ ~ loot minideath:my_head
data modify storage minideath:work head set from entity @e[limit=1,type=item,distance=..0.1,nbt={Item:{components:{"minecraft:custom_data":{item:"my_head"}}}}] Item
kill @e[limit=1,type=item,distance=..0.1,nbt={Item:{components:{"minecraft:custom_data":{item:"my_head"}}}}]
#準備完了

#チェストカートに頭を乗せる
execute as @e[type=minecraft:chest_minecart,tag=md_now] run function minideath:death/sethead

#タグの調整
tag @e[type=minecraft:chest_minecart,limit=1,tag=md_now,sort=nearest] remove id1
tag @e[type=minecraft:chest_minecart,limit=1,tag=md_now,sort=nearest] remove id2
tag @e[type=minecraft:chest_minecart,limit=2,tag=md_now,sort=nearest] add md_chest
tag @e[type=minecraft:chest_minecart,limit=2,tag=md_now,sort=nearest] remove md_now

#リスポン位置変更＆スペクテイターで復活
spawnpoint @s ~ ~ ~ ~
gamemode spectator @s


# 死亡フラグ解除
advancement revoke @s only minideath:death
