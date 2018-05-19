--author: apollo
--【功效】恢复气血=品质*20+200
Item10062 = {
}

function Item10062:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 20 + 200)
end

function Item10062:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10062:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 20 + 200)
end

AddItemTable(Item10062)