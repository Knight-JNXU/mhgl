--BOSS勾魂摄心大法

function skill8048CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8048Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = Lv;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 55 + 2 * (Lv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	if HitRate < 10 then
		HitRate = 10;
	elseif HitRate > 80 then
		HitRate = 80;
	end	
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 2 + math.floor((Lv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		turn = 3;
	end
	
	Target:AddBuff(73, 0, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

