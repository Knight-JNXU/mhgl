--author: apollo
--【功效】恢复气血=品质*4+200，治疗伤势=品质*4+100

Item10028 = {
}

function Item10028:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 4 + 200)
	target:ChangeMHP(qual * 4 +100)
end

function Item10028:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10028:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 4 + 200)
	target:ChangeMHP(qual * 4 +100)
end

AddItemTable(Item10028)