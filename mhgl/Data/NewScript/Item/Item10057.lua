--author: apollo
--【功效】恢复愤怒值=品质*0.5，昏睡2~3回合

Item10057 = {
}

function Item10057:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10057:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item10057:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(qual * 0.5)
	local i = math.random(2,3)
  target:AddBuff(1117, 0, 1, 0, i, 100)

end

AddItemTable(Item10057)