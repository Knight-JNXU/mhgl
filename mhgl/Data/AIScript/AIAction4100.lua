function AIAction4100(battle, mob)	
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not (actor:IsBuffExist(1100) or actor:IsBuffExist(1103) or actor:IsBuffExist(2020) or actor:IsBuffExist(2053)))) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
	end
	
	
	if actorListCount > 0 then
		local r = math.random(1,100)
		if r <= 30 then
			local S = math.random(0, actorListCount - 1);        		
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5122, 0);	
		elseif r <= 60 then
			local S = math.random(0, actorListCount - 1);        		
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5123, 0);	
		elseif r <= 80 then
			local S = math.random(0, actorListCount - 1);        		
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5121, 0);	
		else
			local S = math.random(0, actorListCount - 1);        		
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);	
		end
	elseif actorListCount1 > 0 then
		local r = math.random(1,100)
		if r <= 60 then
			local S = math.random(0, actorListCount1 - 1);	
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5121, 0);
		else
			local S = math.random(0, actorListCount1 - 1);        		
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[S], 0, 0);	
		end
	end	
end