--author: apollo
--莲花白：

Item10058 = {
}

function Item10058:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10058:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item10058:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	target:ChangeDP(qual * 1)
	target:AddBuff(1417, 0, qual*1.5, 0, 150, 100)
end

AddItemTable(Item10058)