--BOSS寒鸡散

function skill8099CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill8099Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.4 * Lv + 10;
	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 60 + 2 * (Lv - Target:GetLevel()) ;
	if HitRate < 10 then
		HitRate = 10;
	elseif HitRate > 85 then
		HitRate = 85;
	end	
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 2 + math.floor((Lv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	Target:AddBuff(51, Lv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

