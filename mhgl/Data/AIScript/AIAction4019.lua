function AIAction4019(battle, mob)	
	
	
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:IsMob() and not actor:IsParnter()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--醉生梦死目标选择列表	
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
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
		
		--己方所有有效目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--凝血术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1202) and actor:GetIndex() == mob:GetIndex()) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--云寂术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1807)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end		
	end
	
	if battle:GetCurTurn() == 3 then
		if protectListCount1 > 0 then
			local S = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 5221, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	else
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 