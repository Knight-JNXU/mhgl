function AIAction4026(battle, mob)	
	
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local actorList2 = {};
	local actorListCount2 = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local protectList3 = {};
	local protectListCount3 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 25;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5637)) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
			
		--聚华化伤目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or actor:IsBuffExist(1102) 
			or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) 
			or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114) 
			or actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 8 and actor:GetCclass() == 4) then
			actorList2[actorListCount2] = actor:GetIndex();
			actorListCount2 = actorListCount2 + 1;
		end
		
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end	
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1516)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end	
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5485) and actor:GetHP() ~= 0) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end	
	end
	
	if protectListCount2 > 9 then
		if protectListCount3 == 0 then
			local S = math.random(0, protectListCount2 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5281, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);			
		end
	else	
		if protectListCount == 1 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else			
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);			
		end
	end
end 