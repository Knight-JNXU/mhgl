function AIAction4037(battle, mob)	
	--GUEST天蚕教药师的AI
	
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
	local protectList2 = {};
	local protectListCount2 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 80;
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
						
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end	
		
		--碧水清茗优先选择BOSS
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5300) and not actor:IsBuffExist(1201)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end	
		
		--碧水清茗有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5301) and not actor:IsBuffExist(1201)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end			
	end
	
	if protectListCount1 > 0 then
		local R = math.random(0, protectListCount1 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5202, 0);
	elseif protectListCount2 > 0 then
		local S = math.random(0, protectListCount2 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5202, 0);
	elseif actorListCount > 0 then
		local T = math.random(0, actorListCount - 1);
		mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end 
end 