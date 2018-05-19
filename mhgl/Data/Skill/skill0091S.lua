--寒雨飞星

function skill0091CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需飞星手修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0091Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展寒雨飞星", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 80 + 2 * (skillLv - Target:GetLevel()) + (Atk:GetSkillLv(0) - Target:GetSkillLv(0))
	if HitRate < 20 then
		HitRate = 20;
	elseif HitRate > 90 then
		HitRate = 90;
	end
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local throwDam = (Atk:GetSkillLv(0) - Target:GetSkillLv(0)) * ( 1 + (Atk:GetSkillLv(0) + Target:GetSkillLv(0) - 1) * (300-100) / ((100 - 1) * 100));
	local FinalDam = 0;
	if math.random(1, 100) > 40 then
		FinalDam = 3.2 * (Atk:GetSkillItemATK() + 1.2 * skillLv + throwDam );
	else
		FinalDam = 1.2 * (Atk:GetSkillItemATK() + 1.2 * skillLv + throwDam );
	end
	
	if FinalDam <= 1 then
		FinalDam = 1;
	end
	
	Target:ChangeHp(-1 * FinalDam);
	battle:PushReactionActor(Target);
	
end

