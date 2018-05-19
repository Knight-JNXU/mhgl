--author: apollo
--七色曼陀罗：补充大量生命。恢复生命18×品质。

Item10047 = {
}

function Item10047:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeSP(qual * 5 + 100 )
end

function Item10047:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10047:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeSP(qual * 5 + 100 )
end

AddItemTable(Item10047)