function AIAction4015(battle, mob)	
	
	
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
	
	local AtkRate = 25;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (actor:HasSkill(5339) or actor:HasSkill(5330))) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--七断七绝掌目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
		not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
		not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
		not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116)) and (not actor:HasSkill(5339) and not actor:HasSkill(5330))) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 4 and actor:GetCclass() == 2) then
			actorList2[actorListCount2] = actor:GetIndex();
			actorListCount2 = actorListCount2 + 1;
		end
		
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--云龙探爪目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(1813)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--化血凝神目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex() and actor:GetSP() < actor:GetLevel() and not actor:IsBuffExist(1200)) then
			protectList2[protectListCount1] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end
		
		--云体风身目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(1502)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end
	end
	
	if battle:GetCurTurn() == 1 then
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5084, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif battle:GetCurTurn() == 2 then
		if protectListCount1 > 0 then
			local T = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5082, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end		
	elseif battle:GetCurTurn() == 3 then		
		if protectListCount3 > 0 then
			local U = math.random(0, protectListCount3 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList3[U], 5086, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 4 then		
		if actorListCount > 0 then
			local V = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[V], 5081, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif battle:GetCurTurn() == 6 then		
		if actorListCount > 0 then
			local W = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[W], 5080, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif battle:GetCurTurn() == 7 then		
		if actorListCount1 > 0 then
			local S = math.random(0, actorListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5083, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end	
end 