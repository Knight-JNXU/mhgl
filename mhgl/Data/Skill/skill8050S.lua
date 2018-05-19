--BOSS天山撞穴

function skill8050CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8050Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local consumeSp = 0.2 * Lv + 20;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rate1 = 0;
	local rate2 = 0;
	local rate3 = 0;
	local rate4 = 0;
	local hitRate = 0;
	local rateMax = 0;
	
	if Target:IsBuffExist(27) then
		local buff = Target:FindBuff(27);
		rate1 = buff:GetBuffValue1();
		hitRate = 100 + 2 *(Lv - rate1);
	else
		if Target:IsBuffExist(28) then
			local buff = Target:FindBuff(28);
			rate2 = buff:GetBuffValue1();
		end
		if Target:IsBuffExist(29) then
			local buff = Target:FindBuff(29);
			rate3 = buff:GetBuffValue1();
		end
		if Target:IsBuffExist(30) then
			local buff = Target:FindBuff(30);
			rate4 = buff:GetBuffValue1();
		end
		
		
		if rate2 > rate3 then
			rateMax = rate2;
		else
			rateMax = rate3;
		end
		
		if rateMax > rate4 then
			
		else
			rateMax = rate4;
		end
		
		hitRate = 100 + 2 *(Lv - rateMax);
	end
	
	if hitRate < 0 then
		hitRate = 0;
	elseif hitRate > 100  then
		hitRate = 100;
	end
	
	if math.random(1, 100) > hitRate then
		Atk:SkillFail("\#W[战斗讯息]：目标中的点穴功力太深，无法解除");
		do return end
	end
	
	Target:RemoveBuff(27);
	Target:RemoveBuff(28);
	Target:RemoveBuff(29);
	Target:RemoveBuff(30);	
	battle:PushReactionActor(Target);
	
end

