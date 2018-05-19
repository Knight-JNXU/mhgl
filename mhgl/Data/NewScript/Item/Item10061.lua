--author: apollo
--糯米酒：

Item10061 = {
}

function Item10061:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10061:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	return true]]
end

function Item10061:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(20)
	target:AddBuff(1119, 0, 1, 0, 3, 100)
end

AddItemTable(Item10061)