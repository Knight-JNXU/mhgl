--author: apollo
--人参:【功效】恢复气血80点，治疗20点的伤势

Item10022 = {
}

function Item10022:MapUse(target)
	if not item:ReduceCount() then return end
	if target and target:GetUserType() == 2 then
		target:ChangeHP(80)
	else
		target:ChangeMHP(20)
		target:ChangeHP(80)
	end
end

function Item10022:CanUse(user, target)
	if target:GetTeam() ~= user:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10022:BattleUse(user, target)
	target:ChangeMHP(20)
	target:ChangeHP(80)
end

AddItemTable(Item10022)