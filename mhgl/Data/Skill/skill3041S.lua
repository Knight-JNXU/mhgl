--金针通脉

function skill3041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需华佗神术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg); 
	end
	
end

function skill3041Use(Atk, Target, battle, skillLv)

	if Target:IsBuffExist(1507) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于金针通脉状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 35) / 20) + 3;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	local bufflist = {1507};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 1);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = ((0.6 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展金针通脉", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 4 + math.floor((skillLv - 25) / 25);
	
	if turn < 4 then 
		turn = 4;
	elseif turn > 9 then
		turn = 9;
	end	
	local i = 0;
	while targetlist[i] ~= nil do
		
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		local effectMaxHp = 1.1 * targetlist[i]:GetMaxHP();
			
		if effectMaxHp <= 1 then
			effectMaxHp = 1;
		end
		
		targetlist[i]:AddBuff(1507, skillLv, effectMaxHp, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
