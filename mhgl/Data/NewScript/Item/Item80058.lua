Item80058= {
}

function Item80058:MapUse(target)
  if not item:ReduceCount() then return end
  ShowHint("获得#P200万#W银两#89")
  player:ChangeMoney(2000000)
end
  

function Item80058:CanUse(user, target)
end

function Item80058:BattleUse(user, target)
end

AddItemTable(Item80058)