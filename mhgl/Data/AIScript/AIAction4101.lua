function AIAction4101(battle, mob)	
	
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5300) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:HasSkill(5300))) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
	end
	
	
	if actorListCount > 0 then
		local r = math.random(1,100)
		local S = math.random(0, actorListCount - 1);   
		if r <= 80 then
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
					if csv.targetType == 4 then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], randomSkill, 0);
					end
				end	
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
		end
	elseif actorListCount1 > 0 then
		local r = math.random(1,100)
		local S = math.random(0, actorListCount1 - 1);  
		if r <= 80 then
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
					if csv.targetType == 4 then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], randomSkill, 0);
					end
				end	
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[S], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[S], 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end	
end