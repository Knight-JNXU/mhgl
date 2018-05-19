Item80059= {
}

function Item80059:MapUse(target)
  if not item:ReduceCount() then return end
  ShowHint("获得#P300万#W银两#89")
  player:ChangeMoney(3000000)
end
  

function Item80059:CanUse(user, target)
end

function Item80059:BattleUse(user, target)
end

AddItemTable(Item80059)