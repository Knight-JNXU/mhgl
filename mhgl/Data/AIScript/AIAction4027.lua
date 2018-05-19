function AIAction4027(battle, mob)
	--保守型
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 0;
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
	
	if mob:GetMob_id() == 30208 then 
		if mob:GetHP() <= 0.15 * mob:GetMaxHP() then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif mob:GetMob_id() == 2461 then 
		if battle:GetCurTurn() >= 5 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif mob:GetMob_id() == 32191 then
		if battle:GetCurTurn() >= 6 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 