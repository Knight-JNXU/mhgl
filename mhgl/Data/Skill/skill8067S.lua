--BOSS霹雳指

function skill8067CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8067Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local consumeSp = 0.4 * Lv + 10;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hitRate = 60 + 2 *(Lv - Target:GetLevel());
	
	if hitRate < 10 then
		hitRate = 10;
	elseif hitRate > 90  then
		hitRate = 90;
	end
	
	if math.random(1, 100) > hitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((Lv - Target:GetLevel()) / 5);
	
	if turn < 1 then
		turn = 0;
	elseif turn > 5 then
		turn = 5;
	end
	
	val1 = Lv;
	
	Target:AddBuff(69, val1, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

