--BOSS点血截脉

function skill8049CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8049Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.6 * Lv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展点血截脉", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 75 + 2 * (Lv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	if HitRate < 0 then
		HitRate = 0;
	elseif HitRate > 90 then
		HitRate = 90;
	end
	
	local turn = 2 + (Lv - Target:GetLevel()) / 5;
	if turn < 0 then
		turn = 0;
	elseif turn > 4 then
		turn = 4;
	end
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	if math.random(1, 100) <= 40 then
		Target:AddBuff(27, Lv, 0, 0, turn, 100);
		battle:PushReactionActor(Target);
	else
		local id = math.random(1, 3);
		if id == 1 then
			Target:AddBuff(28, Lv, 0, 0, turn, 100);
			battle:PushReactionActor(Target);
		elseif id == 2 then
			Target:AddBuff(29, Lv, 0, 0, turn, 100);
			battle:PushReactionActor(Target);
		elseif id == 3 then
			Target:AddBuff(30, Lv, 0, 0, turn, 100);
			battle:PushReactionActor(Target);
		end
	end	
end
