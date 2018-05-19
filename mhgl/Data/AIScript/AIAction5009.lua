--挑战山庄 神秘高手 AI
--封印没有被封印的目标
function AIAction5009(battle, mob)	

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
		--敌方无封状态目标列表
		if actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116)) and not ( actor:HasSkill(306) or actor:HasSkill(268) ) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end			
	end
	local turn = battle:GetCurTurn()
	local V = math.random( 0 , actorListCount - 1 )
	if turn % 4 == 0 and turn ~= 0  then 
		if actorListCount1 > 0 then
			local R = math.random( 0 , actorListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[R], 5162, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
		end
	elseif turn % 4 == 1 then
		if actorListCount1 > 0 then
			local S = math.random( 0 , actorListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5163, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
		end
	elseif turn % 4 == 2 then
		if actorListCount1 > 0 then
			local T = math.random( 0 , actorListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 5144, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
		end		
	elseif turn % 4 == 3 then
		if actorListCount1 > 0 then
			local U = math.random( 0 , actorListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[U], 5165, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
		end		
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 

						