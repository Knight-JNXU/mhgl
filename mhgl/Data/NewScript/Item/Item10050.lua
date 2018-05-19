--author: apollo
--【功效】解除酒类异常状态，恢复魔法=品质*3+50

Item10050 = {
}

function Item10050:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	target:ChangeSP(6 * qual)
end

function Item10050:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10050:BattleUse(user, target)
	local qual = item:GetItem_quality()
	target:ChangeSP(3 * qual + 50)
	local buffid = {1117,1118,1417,1418,1419,1420,1421,1422}
	local i = 1;
	while buffid[i] ~= nil do
		
		target:RemoveBuff(buffid[i]);
		i = i + 1;
	end
end

AddItemTable(Item10050)