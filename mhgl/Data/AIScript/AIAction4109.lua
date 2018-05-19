

function AIAction4109(battle, mob)	
	
	
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
	local protectList3 = {};
	local protectListCount3 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 0;
	local DefRate = 0;
	local ProtectRate = 0;
	local ExcapeRate = 0;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
		--己方所有有效目标选择列表		
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex()  then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
	end
	local turn = battle:GetCurTurn()
	if protectListCount1 < 9 and protectListCount > 0 then
		local T = math.random(0, protectListCount - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList[T], 6514, 0);
	elseif protectListCount1 == 9 then	
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end	
end 