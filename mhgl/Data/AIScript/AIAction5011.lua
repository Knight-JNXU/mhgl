--挑战山庄 风雕像 AI

function AIAction5011(battle, mob)	

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
		

		--未隐身的目标列表
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
	end
	local turn = battle:GetCurTurn()
	local R = math.random( 0 , actorListCount - 1 )
	local T = math.random( 0 , protectListCount - 1 ) 
	if turn % 4 == 1  then 
		if protectListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[T], 5674, 0);
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif actorListCount > 0 then
		mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 

						