--author: apollo
--【功效】恢复愤怒值=品质*0.7，附加昏睡状态2~3回合或附加中毒状态
Item10063 = {
}

function Item10063:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10063:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item10063:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(qual * 0.7)
	local i = math.random(2,3)
	local q = (RandTable({1117, 224}))
  target:AddBuff(q, 0, 1, 0, i, 100)
end

AddItemTable(Item10063)