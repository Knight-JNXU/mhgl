--author: apollo
--七色曼陀罗：补充大量生命。恢复生命18×品质。

Item10027 = {
}

function Item10027:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 8 + 100 )
	target:ChangeMHP(80 + qual)

end

function Item10027:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10027:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 8 + 100 )
	target:ChangeMHP(80 + qual)
end

AddItemTable(Item10027)