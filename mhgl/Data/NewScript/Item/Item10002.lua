--author: apollo
--山药：恢复40点生命和10点生命上限

Item10002 = {
}

function Item10002:MapUse(target)
	if not item:ReduceCount() then return end
	if target and target:GetUserType() == 2 then
		target:ChangeHP(40)
	else
		target:ChangeMHP(10)
		target:ChangeHP(40)
	end
end

function Item10002:CanUse(user, target)
	if target:GetTeam() ~= user:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10002:BattleUse(user, target)
	target:ChangeMHP(10)
	target:ChangeHP(40)
end

AddItemTable(Item10002)