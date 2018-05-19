--普度众生

function skill20052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需金刚经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill20052Use(Atk, Target, battle, skillLv)
	
	
	if Target:IsBuffExist(1506) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在灵动九天状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 35) / 25) + 2;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {1506, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, POWUpSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 25) * 25 + 35;
	local consumeSp = ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展灵动九天", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 35) / 25);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
	
		local effectPow = targetlist[i]:GetPOW() * 1200 / 1000;
		if effectPow <= 1 then
			effectPow = 1;
		end
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:AddBuff(1506, skillLv, effectPow, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end