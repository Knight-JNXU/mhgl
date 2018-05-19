--错影无声

function skill0093CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需迷踪七变修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0093Use(Atk, Target, battle, skillLv)

	local consumeSp = 1.2 * skillLv +10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展错影无声", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hitRate = 65 + 2 *(skillLv - Target:GetLevel()) + 1.5 *(Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	
	if hitRate < 10 then
		hitRate = 10;
	elseif hitRate > 80  then
		hitRate = 80;
	end
	
	if math.random(1, 100) > hitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local hpChange = 0;
	local spChange = 0;
	if math.random(1, 100) <= 50 then
		if Target:GetHP() > 300 * skillLv then
			hpChange = 75 * skillLv;
			spChange = 0.25 * Target:GetSP();
		else
			hpChange = 0.25 * Target:GetHP() + 50;
			spChange = 0.25 * Target:GetSP();
		end
	else
		hpChange = 0.05 * Target:GetHP() + 50;
	end
	
	if hpChange <= 1 then
		hpChange = 1;
	elseif spChange <= 1 then
		spChange = 0;
	end
	
	Target:ChangeHp(-1 * hpChange);
	Target:ChangeSp(-1 * spChange);
	battle:PushReactionActor(Target);
	
end

