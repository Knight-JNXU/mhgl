--author: apollo
--【功效】恢复魔法=品质*10+100
Item10059 = {
}

function Item10059:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeSP(qual * 10 + 100)
end

function Item10059:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10059:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeSP(qual * 10 + 100)
end

AddItemTable(Item10059)