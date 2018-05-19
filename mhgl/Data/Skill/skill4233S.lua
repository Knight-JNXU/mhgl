--达摩圣意

function skill4233CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4233Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeDp = 115;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展达摩圣意", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local buffid = {1000,1001,1002,1003,1004,1005,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,
					1113,1114,1115,1116,1117,1118,1119,1120,1121,1123,1400,1401,1402,1403,1404,1405,1406,1407,1408,
					1409,1410,3096,90001,90002,90003};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local j = 1;
		while buffid[j] ~= nil do
			targetlist[i]:RemoveBuff(buffid[j]);
			j = j + 1;
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

