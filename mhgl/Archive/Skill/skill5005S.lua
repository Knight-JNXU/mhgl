--MOB纵横无方

function skill5005CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5005Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local turn = 2 + math.floor((Lv + 10 - 15) / 30);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end	
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	local effectEva = 10 * Target:GetEVA();
		
	if effectEva <= 1 then
		effectEva = 1;
	end
	
	Target:AddBuff(1500, (Lv + 10), effectEva, 0, turn, 100);
		
	battle:PushReactionActor(Target);
	
end
