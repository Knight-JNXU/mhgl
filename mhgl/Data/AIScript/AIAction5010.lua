--挑战山庄 王锐（万福） AI
--加血的AI
function AIAction5010(battle, mob)	

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
		
		--己方所有有效目标选择列表		
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetHP() <= 0.5 *  actor:GetMaxHP() then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		

		--我方血少的目标列表
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1709)  and actor:GetHP() <= 0.2 * actor:GetMaxHP() then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
	end
	local turn = battle:GetCurTurn()
	local R = math.random( 0 , actorListCount - 1 ) 
	if turn % 4 == 0 and turn ~= 0  then 
		if protectListCount1 > 0 then
			local S = math.random( 0 , protectListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 5188, 0);
		elseif protectListCount > 0 then
			local T = math.random( 0 , protectListCount - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[T], 5182, 0);
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6001, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif turn % 4 == 1 or turn % 4 == 2 then
		if protectListCount > 0 then
			local T = math.random( 0 , protectListCount - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[T], 5182, 0);
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6001, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif turn % 4 == 3 then
		if actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6001, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end		
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 

						