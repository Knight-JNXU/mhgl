function AIAction4035(battle, mob)	
	--GUEST货商的AI
	
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
	
	local AtkRate = 0;
	local SkillRate = 0;
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
		
		--凤飞羽散有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:IsBuffExist(1201)) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end						
	end
	
	local Rate = math.random(1, 100);
	if Rate <= AtkRate then
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end 
	elseif 	Rate > AtkRate and Rate <= SkillRate then
		if protectListCount1 > 0 then
			local S = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 5045, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end 
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end 
end 