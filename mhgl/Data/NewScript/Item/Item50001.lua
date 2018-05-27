
Item50001 = {
}

function Item50001:MapUse(target)
  local lv = player:GetExp()
  if player:GetLevel() >= 60 then
    ShowHint("等级低于60级才能使用#46")
    for i = 1,99 do
		  player:GetItems():RemoveItem(50001,1)
		end
    return
  end
	ShowHint("获得10000000点经验")
	player:ChangeExp(10000000,4)
end



function Item50001:CanUse(user, target)
end

function Item50001:BattleUse(user, target)

end

AddItemTable(Item50001)