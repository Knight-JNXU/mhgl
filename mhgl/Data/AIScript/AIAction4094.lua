function AIAction4094(battle, mob)	
	
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local actorList2 = {};
	local actorListCount2 = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 7 and actor:GetCclass() == 4) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--神灵归元术目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsDead()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--翠烟遁形目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:IsPlayer() and (not actor:IsBuffExist(1700) and not actor:IsBuffExist(1701))) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end				
	end
	
	if protectListCount > 0 then
		local R = math.random(0, protectListCount - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList[R], 5186, 0);	
	elseif actorListCount > 0 then
		local S = math.random(0, actorListCount - 1);
		if math.random(1, 100) <= 75 then
			if math.random(1, 2) == 1 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5100, 0);
			else
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5101, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 