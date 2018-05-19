--author: apollo
--【功效】恢复气血=品质*15+150,魔法=品质*10+100
Item10056 = {
}

function Item10056:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 15 + 150)
	target:ChangeSP(qual * 10 + 10)
end

function Item10056:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10056:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeHP(qual * 15 + 150)
	target:ChangeSP(qual * 10 + 10)
end

AddItemTable(Item10056)