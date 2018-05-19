function AIAction4025(battle, mob)	
	
	
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
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 50;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5637)) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
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
	end
	
	local r = math.random(1, 100)
	if r <= AtkRate then
		if actorListCount1 > 0 then
			local S = math.random(0, actorListCount1 - 1);		
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[S], 0, 0);
		elseif actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);		
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	elseif r > AtkRate and r <= SkillRate then
		local randomSkill = mob:GetRandomSkill();
		if randomSkill ~= 0 then			
			if actorListCount1 > 0 then
				local T = math.random(0, actorListCount1 - 1);				
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], randomSkill, 0);
			elseif actorListCount > 0 then
				local U = math.random(0, actorListCount - 1);		
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[U], randomSkill, 0);	
			end	
		else
			if actorListCount1 > 0 then
				local V = math.random(0, actorListCount1 - 1);		
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[V], 0, 0);
			elseif actorListCount > 0 then
				local W = math.random(0, actorListCount - 1);		
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[W], 0, 0);
			end
		end
	end
	
end 