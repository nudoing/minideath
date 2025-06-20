
#チェスト１が満杯かどうかチェック
execute store success score #ret md.variable run data get storage minideath:work death1[26]

# 死亡アイテム一覧に自分自身を追加
execute if score #ret md.variable matches 0 run data modify storage minideath:work death1 append from entity @s Item

#チェスト１が満杯なら２へ入れる
execute if score #ret md.variable matches 1 run data modify storage minideath:work death2 append from entity @s Item

# 消える
kill @s
