--辟毒术

function skill2831CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需青莲秘籍修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2831Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.2 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展辟毒术", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local buffid  = {1000,1001,1003,1004,3098,3099};
	local rate    = {0,0,0,0,0,0};
	local turnrate = {0,0,0,0,0,0};
	local hitRate = 0;
	local rateMax = 0;
	local turnrateMax = 0;
	
	local i = 1;
	while buffid[i] ~= nil do
		if Target:IsBuffExist(buffid[i]) then
			local buff = Target:FindBuff(buffid[i]);
			rate[i] = buff:GetBuffValue1();
			turnrate[i] = buff:GetBuffCoolDown();
			if rate[i] > rateMax then
				rateMax = rate[i];
			end
			if turnrate[i] > turnrateMax then
				turnrateMax = turnrate[i];
			end
		end
		
		i = i + 1;
	end
	
	if turnrateMax > 0 then
		
		local hitRate = skillLv - rateMax;
		
		if hitRate <= -30 then
			hitRate = 0;
		else
			hitRate = 100;
		end
		
		local allfail = 1;
		if hitRate == 100 then
			i = 1;
			while buffid[i] ~= nil do
				Target:RemoveBuff(buffid[i]);
				
				i = i + 1;
			end
			
			allfail = 0;
		end
		
		if allfail == 1 then
			Atk:SkillFail("\#W[战斗讯息]：目标所中的毒等级太高，解毒失败");
		end
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
end

