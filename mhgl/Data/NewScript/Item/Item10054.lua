--author: apollo
--糯米酒：

Item10054 = {
}

function Item10054:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10054:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	return true]]
end

function Item10054:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(20)
	target:AddBuff(1117, 0, 1, 0, 3, 100)
end

AddItemTable(Item10054)