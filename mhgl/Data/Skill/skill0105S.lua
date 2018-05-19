--满天花雨

function skill0105CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需落英缤纷修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0105Use(Atk, Target, battle, skillLv)
		
	local targetlist = {};
	
	local maxTargetCount = (math.floor((skillLv - 25) / 25) + 2);
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.2 * skillLv + 5) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展满天花雨", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local throwDam = (Atk:GetSkillLv(0) - targetlist[i]:GetSkillLv(0)) * ( 1 + (Atk:GetSkillLv(0) + targetlist[i]:GetSkillLv(0) - 1) * (300-100) / ((100 - 1) * 100));
		local FinalDam = 1.3 * (Atk:GetSkillItemATK() + (2.2 - 0.2 * (math.floor((skillLv - 30 ) / 30))) * skillLv + throwDam );
		--local FinalDam = 1.6 * (Atk:GetSkillItemATK() + (2.2 - 0.2 * (math.floor((skillLv - 30 ) / 30))) * skillLv + throwDam );
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		
		--if math.random(1, 100) <= 100 then
			--if faction == 5 and math.random(1, 100) <= 20 then
			--	targetlist[i]:AddBuff(1, 0, 0, 0, 2, 100);
			--else
			--	targetlist[i]:AddBuff(1, 0, 0, 0, 2, 100);
			--end
		--end
		local result = skillCanHit(Atk, Target);
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1, 100) <= 30 then
			targetlist[i]:AddBuff(1, 0, 0, 0, 2, 100);
			
		end
		
		
		i = i + 1;
	end
	
end

