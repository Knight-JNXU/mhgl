function AIAction4012(battle, mob)	
	
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local actorList2 = {};
	local actorListCount2 = 0;
	local actorList3 = {};
	local actorListCount3 = 0;
	local actorList4 = {};
	local actorListCount4 = 0;
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (actor:HasSkill(5339) or actor:HasSkill(5331))) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--醉生梦死目标选择列表	
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116)) and (not actor:HasSkill(5339) and not actor:HasSkill(5330))) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--回天乏力目标选择列表	
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
			actorList2[actorListCount2] = actor:GetIndex();
			actorListCount2 = actorListCount2 + 1;
		end
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 2 and actor:GetCclass() == 4) then
			actorList3[actorListCount3] = actor:GetIndex();
			actorListCount3 = actorListCount3 + 1;
		end
		
		--最后普通攻击目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() --[[and actor:IsValidTarget()]] and actor:IsBuffExist(1700)) then
			actorList4[actorListCount4] = actor:GetIndex();
			actorListCount4 = actorListCount4 + 1;
		end
		
		--己方所有有效目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--凝血术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(1202)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--云寂术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(1807)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end		
		
		--气疗术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:IsPlayer() and not actor:IsBuffExist(1203)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end
	end
	
	if battle:GetCurTurn() == 1 then
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5220, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 2 then
		if protectListCount1 > 0 then
			local T = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5221, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 3 then
		if protectListCount3 > 0 then
			local V = math.random(0, protectListCount3 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList3[V], 5227, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 4 then
		if actorListCount1 > 0 then
			local S = math.random(0, actorListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5223, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif battle:GetCurTurn() == 5 then
		if protectListCount2 > 0 then
			local U = math.random(0, protectListCount2 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[U], 5222, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 6 then
		if actorListCount4 > 0 then
			local W = math.random(0, actorListCount4 - 1);
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList4[W], 0, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 