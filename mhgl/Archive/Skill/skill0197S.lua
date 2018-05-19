--打草惊蛇

function skill0197CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需醉斩天魔修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0197Use(Atk, Target, battle, skillLv)

	local consumeSp = 1.2 * skillLv +10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展打草惊蛇", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hpChange = 0;
	
	
	if Target:GetFaction() == 5 and Target:GetCclass() == 2 then
		hpChange = (math.floor((skillLv - 35 )/ 35) * 0.05 + 0.1) * Target:GetHP();
	else
		hpChange = 1;
	end

	if hpChange <= 1 then
		hpChange = 1;
	end
	if Atk:IsBuffExist(81) then
		--Target:MissSkill();
		local Msg1 = string.format("一次战斗只能使用一次该技能");
		Atk:SkillFail(Msg1);
	else
		Target:ChangeHp(-1 * hpChange);
		Atk:AddBuff(81,0,0,0,255,100);
	end
	battle:PushReactionActor(Target);
	
end

