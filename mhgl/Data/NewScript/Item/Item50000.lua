
Item50000 = {
}

function Item50000:MapUse(target)
  local lv = player:GetExp()
  if player:GetLevel() >= 60 then
    ShowHint("等级低于60级才能使用#46")
    for i = 1,50 do
		  player:GetItems():RemoveItem(50000,1)
		end
    return
  end
	ShowHint("获得10000000点经验")
  player:ChangeExp(10000000,4)
  player:GetItems():RemoveItem(10000000,1)
end



function Item50000:CanUse(user, target)
end

function Item50000:BattleUse(user, target)

end

AddItemTable(Item50000)