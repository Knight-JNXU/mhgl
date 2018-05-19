--主线任务，“小弟”AI

function AIAction4086(battle, mob)
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;			
		end
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;		
		end
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and not actor:HasSkill(5301)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;		
		end
		
		--解封目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or actor:IsBuffExist(1102)
			or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) 
			or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114) 
			or actor:IsBuffExist(1115) or actor:IsBuffExist(1116))) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end	
	end
	
	if protectListCount2 >= 2 then
		local R = math.random(0, protectListCount2 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[R], 5280, 0);
	else
		if actorListCount > 0 then
			local S = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 