--author: apollo
--逃情酒：还原人物所有已加的潜能点

Item60228 = {
}

function Item60228:MapUse(target)
if player:GetLevel() > 144 then
     ShowHint("145以上不能洗点")
	 return
	 end
	if not item:ReduceCount() then return end
	
	local Lvl = player:GetLevel()
	player:ResetCharLevel(Lvl)
	ShowHint("请重新分配人物属性点")
end

function Item60228:CanUse(user, target)
end

function Item60228:BattleUse(user, target)

end

AddItemTable(Item60228)