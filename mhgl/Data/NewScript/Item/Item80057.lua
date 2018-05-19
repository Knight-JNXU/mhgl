Item80057= {
}

function Item80057:MapUse(target)
  if not item:ReduceCount() then return end
  ShowHint("获得#P10万#W银两#89")
  player:ChangeMoney(100000)
end
  

function Item80057:CanUse(user, target)
end

function Item80057:BattleUse(user, target)
end

AddItemTable(Item80057)