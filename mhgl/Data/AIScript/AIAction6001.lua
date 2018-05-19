--解封的AI
function AIAction6001(battle, mob)	

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
		
		--我方被封印的目标列表
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() then
		   if not ( actor:HasSkill(306) or actor:HasSkill(268) ) then
		      if actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or
			     actor:IsBuffExist(1102) or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or
			     actor:IsBuffExist(1107) or actor:IsBuffExist(1108) or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or
			     actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114) or actor:IsBuffExist(1115) or actor:IsBuffExist(1116) or
			     actor:IsBuffExist(1000) or actor:IsBuffExist(1001) or actor:IsBuffExist(1002) or actor:IsBuffExist(1003) or actor:IsBuffExist(1004) or
			     actor:IsBuffExist(1005) or actor:IsBuffExist(1119) or actor:IsBuffExist(1120) or actor:IsBuffExist(1121) or actor:IsBuffExist(1122) or 
			     actor:IsBuffExist(1123) or actor:IsBuffExist(1124) or actor:IsBuffExist(1126) or actor:IsBuffExist(1531) or actor:IsBuffExist(1540) or
			     actor:IsBuffExist(1541) or actor:IsBuffExist(7025) or actor:IsBuffExist(1410) or actor:IsBuffExist(3096) or actor:IsBuffExist(1414) then
			      protectList1[protectListCount1] = actor:GetIndex();
			      protectListCount1 = protectListCount1 + 1;
			   end
		   end
		end		
	end
	local turn = battle:GetCurTurn()
	local R = math.random( 0 , actorListCount - 1 ) 
	if turn % 2 == 0 and turn ~= 0 then 
	
		if protectListCount1 > 4 then
			local S = math.random( 0 , protectListCount1 - 1 )
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 5280, 0);

		elseif actorListCount > 0 and turn % 4 == 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6202, 0);
		elseif actorListCount > 0 then
		    mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6001, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	
	
	
	
	elseif turn ~= 1 then
		if actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6001, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end		
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 

						