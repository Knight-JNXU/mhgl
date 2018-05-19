--BOSS附骨针

function skill8059CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	--do return end
end

function skill8059Use(Atk, Target, battle, skillLv)

    local Lv = Atk:GetLevel();
	local consumeSp = 0.1 * Lv + 10;	
	if  Atk:GetSP() < consumeSp then
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
		
	local hitRate = 65 + 2 *(Lv - Target:GetLevel()) + 1.5 *(Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	
	if hitRate < 0 then
		hitRate = 0;
	elseif hitRate > 90  then
		hitRate = 90;
	end
	
	if math.random(1, 100) > hitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((Lv - Target:GetLevel()) / 5);
	
	if turn < 0 then
		turn = 0;
	elseif turn > 5 then
		turn = 5;
	end
	
	Target:AddBuff(21, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

