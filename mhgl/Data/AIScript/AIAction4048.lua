function AIAction4048(battle, mob)	
	--4048号AI
	
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
	
	
	if mob:GetMob_id() == 2457 then
		if battle:GetCurTurn() >= 2 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local R = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		end
	elseif mob:GetMob_id() == 2458 then
		if battle:GetCurTurn() >= 3 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local S = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
			end
		end
	elseif mob:GetMob_id() == 2459 then
		if battle:GetCurTurn() >= 4 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount > 0 then
				local T = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
			end
		end
	end
end 