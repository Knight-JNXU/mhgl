--MOB逃跑术

function skill5271CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5271Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local nDam = 1.02 ^ (math.floor((Lv+100)/173) * math.floor((Lv-73)/3)) * 0.98 ^ Target:GetSkillLv(379);
	local HitRate = 100;
	local HitRateBase = 100;

	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 120;		
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:AddBuff(3094, (Lv + 10), 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end

