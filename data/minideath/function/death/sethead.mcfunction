#チェストカートが呼ぶと、頭が乗る。

#頭表示エンティティ召喚
summon item_display ~ ~ ~ {Tags:["md_entity","md_head","md_head_now"],transformation:{right_rotation:{angle:1.57f,axis:[0,1,0]},scale:[1,1,1],left_rotation:[0f,0f,0f,1f],translation:[0f,0.9f,0f]}}

#頭情報のコピー
data modify entity @e[limit=1,type=item_display,tag=md_head_now,distance=..0.1] item set from storage minideath:work head

#上に乗せる
ride @e[limit=1,type=item_display,tag=md_head_now,distance=..0.1] mount @s

#今設置中フラグ消す
tag @e[type=item_display,tag=md_head_now] remove md_head_now



