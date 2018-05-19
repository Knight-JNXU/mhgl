--BOSS翠烟遁形

function skill8068CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8068Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.3 * Lv + 5;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = math.floor((Lv - 20) / 30);
	
	Target:AddBuff(70, Lv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

