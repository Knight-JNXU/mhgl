--author: apollo
--【功效】解除毒类异常状态，恢复气血=品质*3

Item10052 = {
}

function Item10052:MapUse(target)
	if not item:ReduceCount() then return end
	local qual = item:GetItem_quality()
	if target and target:GetUserType() == 2 then
		target:ChangeHP(3 * qual)
	else
		target:ChangeHP(3 * qual)
	end
end

function Item10052:CanUse(user, target)
	if user:GetTeam() ~= target:GetTeam() then
		ShowError("目标错误，不能给敌方使用！")
		return false
	end
	
	return true
end

function Item10052:BattleUse(user, target)
	
	local qual = item:GetItem_quality()
	target:ChangeHP(3 * qual)
	local buffid = {1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1118,1119,1120,1121,1123,1124,1127,1400,1401,1403,1404,1405,1406,1407,1408,1409,1410,1415,1416,1531,1540,1541,7025,3098,3099,2012,90001,90002}
	local i = 1;
	while buffid[i] ~= nil do
		target:RemoveBuff(buffid[i]);
		i = i + 1;
	end
end

AddItemTable(Item10052)