--author: apollo
--【功效】恢复愤怒值=品质*1，附加疯狂状态3~4回合
Item60126 = {
}

function Item60126:MapUse(target)
	if not item:ReduceCount() then return end
	  player:ChangeSMoney(1000000)
	  ShowHint("获得100万储备金")
	
	
	
	
	
end

function Item60126:CanUse(user, target)
	--[[if not user:IsPlayer() and user ~= target then
		ShowError("该物品只能由玩家自身使用。")
		return false
	end
	
	return true]]
end

function Item60126:BattleUse(user, target)
end

AddItemTable(Item60126)