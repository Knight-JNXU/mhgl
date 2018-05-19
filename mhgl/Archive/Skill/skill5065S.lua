--MOB金光云拂

function skill5065CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5065Use(Atk, Target, battle, skillLv)
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
	
	local effectHit = 10 * Atk:GetHIT();
	
	if effectHit <= 1 then
		effectHit = 1;
	end
	
	if Atk:IsMob() then
		if Atk:GetMob_id() == 30307 then
			if Atk:GetSP() < 4 * Atk:GetLevel() then
				do return end
			end
			local sp = Atk:GetSP();
			turn = 3;
			Atk:ChangeSp(-1 * sp, false);
		end		
	end
	
	Target:AddBuff(1501, (Lv + 10), effectHit, 0, turn, 100);
	battle:PushReactionActor(Target);	
end
