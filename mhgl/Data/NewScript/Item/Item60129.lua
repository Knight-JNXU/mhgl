-- 定义物品表 : 物品表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Item60129 = {
}

function Item60129:MapUse(target)
  ISay("一个大雪球,快去堆雪人吧")
  
  
end

function Item60129:CanUse(user, target) 
end

function Item60129:BattleUse(user, target)
end

AddItemTable(Item60129)