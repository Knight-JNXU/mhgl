--author: apollo
--【功效】恢复气血=品质*12+150

Item10030 = {
}

function Item10030:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 12 + 150)
end

function Item10030:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10030:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 12 + 150)
end

AddItemTable(Item10030)