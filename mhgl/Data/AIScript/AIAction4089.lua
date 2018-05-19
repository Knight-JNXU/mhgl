--主线任务，“秋月”AI

function AIAction4089(battle, mob)
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;	
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local protectList3 = {};
	local protectListCount3 = 0;
	
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
		
		--护体玄针目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and not actor:IsBuffExist(1504)) then
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
		
		--天魔刀的丁鹏是否在场
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and actor:HasSkill(6232)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;		
		end	
	end
	
	if protectListCount1 > 0 then
		local R = math.random(0, protectListCount1 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5184, 0);
	elseif protectListCount2 > 0 then
		local S = math.random(0, protectListCount2 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5297, 0);
	else
		if protectListCount3 > 0 then
			if math.random(1, 100) <= 75 then
				local T = math.random(0, protectListCount3 - 1);
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList3[T], 5182, 0);
			else
				if actorListCount > 0 then
					local U = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);	
				else
					mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end
			end
		else
			if actorListCount > 0 then
				local V = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);	
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		end
	end
end 