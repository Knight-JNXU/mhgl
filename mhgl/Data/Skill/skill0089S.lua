--点血截脉

function skill0089CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需点血截脉修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0089Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.6 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展点血截脉", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 65 + 2 * (skillLv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	if HitRate < 0 then
		HitRate = 0;
	elseif HitRate > 90 then
		HitRate = 90;
	end
	
	local turn = 2 + (skillLv - Target:GetLevel()) / 5;
	if turn < 0 then
		turn = 0;
	elseif turn > 4 then
		turn = 4;
	end
	
	local val1 = skillLv;
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local result = skillCanHit(Atk, Target);
	
	if math.random(1, 100) <= 40 then

		if result == 2 then
			Target:MissSkill();
		else
			Target:AddBuff(27, val1, 0, 0, turn, 100);
		end
		battle:PushReactionActor(Target);
	else
		local id = math.random(1, 3);
		if id == 1 then
			if result == 2 then
				Target:MissSkill();
			else
				Target:AddBuff(28, val1, 0, 0, turn, 100);
			end
			battle:PushReactionActor(Target);
		elseif id == 2 then
			if result == 2 then
				Target:MissSkill();
			else
				Target:AddBuff(29, val1, 0, 0, turn, 100);
			end
			battle:PushReactionActor(Target);
		elseif id == 3 then
			if result == 2 then
				Target:MissSkill();
			else
				Target:AddBuff(30, val1, 0, 0, turn, 100);
			end
			battle:PushReactionActor(Target);
		end
	end
	
end

