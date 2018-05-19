--BOSS子母针

function skill8057CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8057Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local consumeSp = 0.4 * Lv + 10;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hitRate = 65 + 2 *(Lv - Target:GetLevel()) ;
	
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
	
	Target:AddBuff(19, Lv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

