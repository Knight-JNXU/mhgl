--author: apollo
--八角莲叶:【功效】恢复气血60点，治疗15点的伤势

Item10020 = {
}

function Item10020:MapUse(target)
	if not item:ReduceCount() then return end
	if target and target:GetUserType() == 2 then
		target:ChangeHP(60)
	else
		target:ChangeMHP(15)
		target:ChangeHP(60)
	end
end

function Item10020:CanUse(user, target)
	if target:GetTeam() ~= user:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10020:BattleUse(user, target)
	target:ChangeMHP(15)
	target:ChangeHP(60)
end

AddItemTable(Item10020)