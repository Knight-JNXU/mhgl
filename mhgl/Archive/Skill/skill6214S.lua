--MOB迎风一刀斩(真正发动)

function skill6214Use(Atk, Target, battle, skillLv)
    
	local Lv = Atk:GetLevel();
	local FinalDam = Target:GetHP() - 1;
	if Target:GetHP() < 0.5 * Target:GetMaxHP() then
		FinalDam = Target:GetHP()
	end
	
	if FinalDam < 10 then
		FinalDam = math.random(1, 10)
	end
	
	Target:ChangeHp(-1 * FinalDam);
	
	local turn = 4 + math.floor((Lv + 10 - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	Target:AddBuff(1705, (Lv + 10), 0, 0, turn, 100)	
	Target:AddBuff(3128, (Lv + 10), 0, 0, 150, 100)	
	battle:PushReactionActor(Target);

end
