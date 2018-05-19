--author: apollo
--【功效】恢复气血=品质*10,恢复伤势=品质*10+10
Item10055 = {
}

function Item10053:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 10)
	target:ChangeMHP(qual * 10 + 10)
end

function Item10053:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10053:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 10)
	target:ChangeMHP(qual * 10 + 10)
end

AddItemTable(Item10053)