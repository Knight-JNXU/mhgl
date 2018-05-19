--author: apollo
--【功效】恢复愤怒值=品质*1，附加疯狂状态3~4回合
Item10064 = {
}

function Item10064:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10064:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item10064:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(qual * 1)
	local i = math.random(3,4)
  target:AddBuff(1119, 0, 1, 0, i, 100)
end

AddItemTable(Item10064)