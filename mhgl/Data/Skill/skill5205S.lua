--MOB百毒归元

function skill5205CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5205Use(Atk, Target, battle, skillLv)
	--Sp=0.2 * 技能等级 +10
	--[[local consumeSp = 0.2 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展百毒归元", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]

	--local skillid = {2041,2411,3031};
	local Lv = Atk:GetLevel();
	local buffid = {1000,1001,1002,1003,1004,1005,3098,3099};--对应skillid
	local rate = {0, 0, 0, 0, 0, 0, 0, 0};
	local hitRate = 0;
	local rateMax = 0;
	local i = 1;
	
	while buffid[i] ~= nil do
		if Target:IsBuffExist(buffid[i]) then
			local buff = Target:FindBuff(buffid[i]);
			rate[i] = buff:GetBuffValue1();
			if rate[i] > rateMax then
				rateMax = rate[i];
			end
		end
		
		i = i + 1;
	end
	
	if rateMax >= 0 then
		
		local hitRate =  rateMax - Lv - 10; --中buff等级超过所用技能等级30 则命中=0 else 命中= 100
		
		if hitRate > 30 then
			hitRate = 0;
		else
			hitRate = 100;
		end
		
		local allfail = 1;
		if  hitRate == 100 then
			i= 1;
			while buffid[i] ~= nil do
			
				Target:RemoveBuff(buffid[i]);
				
				i = i + 1;
			end
			local turn = 1 + math.floor ((Lv + 10 - 20) / 45);
			if turn < 1 then
				turn = 1;
			elseif turn > 2 then
				turn = 2;
			end
			
			Target:AddBuff(1605, (Lv + 10), 0, 0, turn, 100);
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


