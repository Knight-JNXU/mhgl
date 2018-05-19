--满天花雨

function skill2411CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需落英秘籍修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2411Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 25) / 20) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 20) * 20 + 25;
	local consumeSp = ((0.4 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展满天花雨", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
		
	local i = 0;
	while targetlist[i] ~= nil do 
		
		local nDam = Atk:GetSkillLv(2450);
		local FinalDam = skillLv + Atk:GetSkillItemATK() + nDam * 1.5;
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		local duRate = math.floor(Atk:GetSkillLv(2450) / 15) + 25;
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();		
		elseif math.random(1, 100) <= duRate then
			if (targetlist[i]:IsBuffExist(1001) or targetlist[i]:IsBuffExist(1002)) ==  false then
				targetlist[i]:AddBuff(1001, skillLv, 0, 0, 3, 100);
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

