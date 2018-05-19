--BOSS气聚丹田

function skill8018CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8018Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0.3 * Lv + 10;
	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local AttriPow = 0.5 * Lv
	Target:AddBuff(36, 0, AttriPow, 0, 6, 100);
	battle:PushReactionActor(Target);
	
end
