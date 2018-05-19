--天山撞穴

function skill0090CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需点血截脉修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0090Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.2 * skillLv + 20;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展天山撞穴", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
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
		hitRate = 100 + 2 *(skillLv - rate1);
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
		
		hitRate = 100 + 2 *(skillLv - rateMax);
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

