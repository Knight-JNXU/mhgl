--水月镜花

function skill8065CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8065Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.4 * Lv +10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展水月镜花", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	--local skillid = {2421,2422,2442};
	local buffid = {1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111 , 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120,
					1121, 1122, 1123, 1124, 1125, 1126, 1127};	--对应skillid
	local rate = {0, 0, 0, 0};
	local turnrate = {0,0,0,0};
	local hitRate = 100;
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
		local allfail = 1;
		if  hitRate == 100 then
			i = 1;
			while buffid[i] ~= nil do
			
				Target:RemoveBuff(buffid[i]);
				
				i = i + 1;
			end
			local turn = 1;
			
			Target:AddBuff(1607, 1, 0, 0, turn, 100);
			allfail = 0;
		end
		
		if allfail == 1 then
			Atk:SkillFail("\#W[战斗讯息]：目标所中的点穴等级太高，解穴失败");
		end
		
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end


