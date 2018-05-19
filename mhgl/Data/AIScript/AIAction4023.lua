function AIAction4023(battle, mob)	
	--掷杯山庄任务“花之武者”AI
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
		
	local atkActor = -1;
	local protectActor = -1;

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
	end
	
	
	
	if protectListCount == 1 then
		mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);		
	elseif mob:GetHP() < 0.75 * mob:GetMaxHP() then
		local R = math.random(0, actorListCount - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5003, 0);	
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end	
end 