--寡育令

function skill12032CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需灵通术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill12032Use(Atk, Target, battle, skillLv)
	--Sp=0.2 * 技能等级 +10
	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展寡欲令", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	--local skillid = {2421,2422,2442};
	local buffid = {90001, 90002, 1112, 1114};	--对应skillid
	local rate = {0, 0, 0, 0};
	local turnrate = {0,0,0,0};
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
		
		local hitRate =  rateMax - skillLv; 	--中buff等级超过所用技能等级30 则命中=0 else 命中= 100
		
		if hitRate > 30 then
			hitRate = 0;
		else
			hitRate = 100;
		end
		
		local allfail = 1;
		if  hitRate == 100 then
			i = 1;
			while buffid[i] ~= nil do
			
				Target:RemoveBuff(buffid[i]);
				
				i = i + 1;
			end
			local turn = 1 + math.floor ((skillLv - 30) / 45);
			if turn < 1 then
				turn = 1;
			elseif turn > 2 then
				turn = 2;
			end
			Target:AddBuff(1602, skillLv, 0, 0, turn, 100);
			allfail = 0;
		end
		
		if allfail == 1 then
			Atk:SkillFail("\#W[战斗讯息]：目标所中的封印等级太高，解封失败");
		end
		
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end


