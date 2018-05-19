--author: apollo
--超级摆摊卡：可获得4小时的摆滩时间

Item80055 = {
}

function Item80055:MapUse(target)
    if not player:HasSkill(373) then
	ShowHint("没有摆摊技能不能使用摆摊卡")
	return
	end
	
	if player:GetLevel() < 20 then 
	ShowHint("20级以后才能摆摊")
	return 
	end
	
	if player:GetHawkerTime()+240 > 1440 then
	ShowHint("离线摆摊时间最长不能超过24小时")
	return 
	end
	
	if not item:ReduceCount() then return end
	local Time = player:GetHawkerTime()+240;
	ShowHint(string.format("获得摆摊时间4小时,你现在的总摆摊时间为%d分钟。",Time));
	player:SetHawkerTime(Time)--]]
end

function Item80055:CanUse(user, target)
end

function Item80055:BattleUse(user, target)

end

AddItemTable(Item80055)