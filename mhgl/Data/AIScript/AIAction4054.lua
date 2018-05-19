function AIAction4054(battle, mob)	
	--4054号AI
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 25;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
	end
	
	
	if mob:GetMob_id() == 30351 then
		if battle:GetCurTurn() >= 2 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local R = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		end
	elseif mob:GetMob_id() == 30352 then
		if battle:GetCurTurn() >= 3 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local randomSkill = mob:GetRandomSkill();
				if randomSkill ~= 0 then
				    local csv = mob:GetSkillCsvData(randomSkill);
					if csv ~= nil then
						local S = math.random(0, actorListCount - 1);
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], randomSkill, 0);
					end
				end
			end
		end
	elseif mob:GetMob_id() == 30353 then
		if battle:GetCurTurn() >= 4 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local T = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
			end
		end
	elseif mob:GetMob_id() == 30354 then
		if battle:GetCurTurn() >= 5 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local randomSkill = mob:GetRandomSkill();
				if randomSkill ~= 0 then
				    local csv = mob:GetSkillCsvData(randomSkill);
					if csv ~= nil then
						local U = math.random(0, actorListCount - 1);
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[U], randomSkill, 0);
					end
				end			
			end
		end	
	elseif mob:GetMob_id() == 30355 then
		if battle:GetCurTurn() >= 6 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local V = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
			end
		end		
	elseif mob:GetMob_id() == 30356 then
		if battle:GetCurTurn() >= 7 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local randomSkill = mob:GetRandomSkill();
				if randomSkill ~= 0 then
				    local csv = mob:GetSkillCsvData(randomSkill);
					if csv ~= nil then
						local W = math.random(0, actorListCount - 1);
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[W], randomSkill, 0);
					end
				end		
			end
		end		
	elseif mob:GetMob_id() == 30357 then
		if battle:GetCurTurn() >= 8 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local X = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[X], 0, 0);
			end
		end		
	elseif mob:GetMob_id() == 30358 then
		if battle:GetCurTurn() >= 9 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local randomSkill = mob:GetRandomSkill();
				if randomSkill ~= 0 then
				    local csv = mob:GetSkillCsvData(randomSkill);
					if csv ~= nil then
						local Y = math.random(0, actorListCount - 1);
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[Y], randomSkill, 0);
					end
				end						
			end
		end		
	elseif mob:GetMob_id() == 30359 then
		if battle:GetCurTurn() >= 10 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local Z = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[Z], 0, 0);
			end
		end				
	end
end 