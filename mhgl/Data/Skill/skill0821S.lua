--细雨如愁

function skill0821CanUse(Atk, skillLv, reqCharLv)
	
	if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0821Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 5;
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local consumeDp = Atk:GetElementSkillCost(821);
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足%d，无法施展细雨如愁", consumeDp);
	
	if  Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 6;
		
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		if not targetlist[i]:IsBuffExist(1952) then
			targetlist[i]:AddBuff(1952, skillLv, 0, 0, turn, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
