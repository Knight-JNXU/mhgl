--九转离魂

function skill4283CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4283Use(Atk, Target, battle, skillLv)
	
	local BwskillLv = Atk:GetLevel();
	local targetlist = {};
	local consumeDp = 90;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展九转离魂", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if math.random(1, 100) > 85 then
			local Rate = math.random(1, 18);
			local BuffTable = {
				{Buff_id = 1100,Buff_name = "米酒"},
				{Buff_id = 1101,Buff_name = "烧刀子"},
				{Buff_id = 1102,Buff_name = "加饭酒"},	
				{Buff_id = 1103,Buff_name = "清酒"},
				{Buff_id = 1104,Buff_name = "甜酒"},
				{Buff_id = 1105,Buff_name = "糯米酒"},	
				{Buff_id = 1106,Buff_name = "百花酒"},
				{Buff_id = 1107,Buff_name = "古龙醇"},
				{Buff_id = 1108,Buff_name = "梦幻酿"},
				{Buff_id = 1109,Buff_name = "高梁大曲"},
				{Buff_id = 1110,Buff_name = "陈年老窖"},
				{Buff_id = 1112,Buff_name = "红花蜜露酒"},
				{Buff_id = 1114,Buff_name = "甘草白果酒"},
				{Buff_id = 1115,Buff_name = "陈年汾酒"},	
				{Buff_id = 1116,Buff_name = "波斯葡萄酒"},
				{Buff_id = 1119,Buff_name = "玫瑰露"},
				{Buff_id = 1120,Buff_name = "老花雕"},	
				{Buff_id = 1121,Buff_name = "女儿红"}};
				
			local buffevent = BuffTable[Rate].Buff_id;
			targetlist[i]:AddBuff(buffevent, BwskillLv, 1, 0, 3, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

