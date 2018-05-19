function AIAction4099(battle, mob)	
	
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:IsPlayer() and (not actor:HasBuff(1531))) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
	end
	
	
	if actorListCount > 0 then	
		local S = math.random(0, actorListCount - 1);	           		
		mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 6512, 0);	
	elseif actorListCount1 > 0 then
		local S = math.random(0, actorListCount1 - 1);	
		mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5200, 0);
	end	
	
end