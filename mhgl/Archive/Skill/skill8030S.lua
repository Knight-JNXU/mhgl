--BOSS行云流水

--skill Return number 0 = success, 1 = fail

function skill8030CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8030Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.4 * Lv + 10;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Target:AddBuff(55, Lv, 0, 0, 6, 100);	
	battle:PushReactionActor(Target);	
end

