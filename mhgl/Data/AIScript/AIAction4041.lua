function AIAction4041(battle, mob)	
	
	
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
	local targetclass = 1;
	
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
		
		--七断七绝掌目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
		not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
		not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
		not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
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
		
		--云体风身有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(1502)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--玩家职业判定
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetCclass() == 4) then
			targetclass = 4;
		end
	end
	
	local Rate = math.random(1, 100);
	if targetclass == 4 then
		if protectListCount1 > 0 then
			local R = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5086, 0);
		else 
			local ckskill = math.random(1, 100);
			if ckskill <= 40 then
				if actorListCount > 0 then
					local S = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5080, 0);
				end
			elseif ckskill > 40 and ckskill <= 80 then
				if actorListCount > 0 then
					local T = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5084, 0);
				end
			else
				if actorListCount1 > 0 then
					local U = math.random(0, actorListCount1 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[U], 5083, 0);
				end
			end
		end
	else
		local xkskill = math.random(1, 100);
		if actorListCount > 0 then
			local V = math.random(0, actorListCount - 1);
			if xkskill <= 50 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[V], 5020, 0);
			else
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[V], 5023, 0);
			end
		end
	end
end 