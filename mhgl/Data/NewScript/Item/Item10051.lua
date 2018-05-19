--author: apollo
--【功效】解除毒类异常状态，恢复气血=品质*4，恢复防御=品质*0.4

Item10051 = {
}

function Item10051:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	if target and target:GetUserType() == 2 then
		target:ChangeHP(4 * qual)
	else
		target:ChangeMHP(0.4 * qual)
		target:ChangeHP(4 * qual)
	end
end

function Item10051:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10051:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	
	target:ChangeMHP(0.4 * qual)
	target:ChangeHP(4 * qual)
	local buffid = {1000,1001,1002,1003,1004,1005,3098,3099}
	local i = 1;
	while buffid[i] ~= nil do
		
		target:RemoveBuff(buffid[i]);
		i = i + 1;
	end
end

AddItemTable(Item10051)