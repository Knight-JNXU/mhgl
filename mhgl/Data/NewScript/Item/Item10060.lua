--author: apollo
--【功效】恢复愤怒值=品质*0.4+10

Item10060 = {
}

function Item10060:MapUse(target)
	ShowError("该物品只能在战斗中使用！")
end

function Item10060:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item10060:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeDP(qual * 0.4 + 10)

end

AddItemTable(Item10060) 