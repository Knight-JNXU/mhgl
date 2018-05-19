function AIAction4018(battle, mob)
	--4018号AI
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 50;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:IsMob() and not actor:IsParnter()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;			
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
	end
	
	
	if actorListCount > 0 and (not mob:IsBuffExist(1100) and not mob:IsBuffExist(1101) and
		not mob:IsBuffExist(1102) and not mob:IsBuffExist(1103) and not mob:IsBuffExist(1104) and not mob:IsBuffExist(1105) and not mob:IsBuffExist(1106) and
		not mob:IsBuffExist(1107) and not mob:IsBuffExist(1108) and not mob:IsBuffExist(1109) and not mob:IsBuffExist(1110) and not mob:IsBuffExist(1111) and
		not mob:IsBuffExist(1112) and not mob:IsBuffExist(1113) and not mob:IsBuffExist(1114) and not mob:IsBuffExist(1115) and not mob:IsBuffExist(1116)) then
		local R = math.random(0, actorListCount - 1);
		local randomSkill = mob:GetRandomSkill();
		if randomSkill ~= 0 then
			local csv = mob:GetSkillCsvData(randomSkill);
	        if csv ~= nil then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 