function AIAction4056(battle, mob)	
	
	
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
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--神灵归元术目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:HasSkill(5300) and actor:GetHP() == 0 and not actor:IsBuffExist(1303)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
		--万能解封术目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or actor:IsBuffExist(1102)
			or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) 
			or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114) 
			or actor:IsBuffExist(1115) or actor:IsBuffExist(1116))) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end	
		
		--医生数量		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:HasSkill(5186) and actor:GetHP() ~= 0) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end
	end
	
	if protectListCount1 > 0 then		
		local R = math.random(0, protectListCount1 - 1);
		local U = math.random(0, actorListCount - 1);
		local fuhuorate = math.random(1, 100);
		if fuhuorate <= math.floor(100/protectListCount3) then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[R] , 5186, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);
		end
	elseif protectListCount2 > 0 then
		local S = math.random(0, protectListCount2 - 1);
		local V =  math.random(0, actorListCount - 1);
		local jiefengrate = math.random(1, 100);
		if jiefengrate <= math.floor(100/protectListCount3) then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S] , 5297, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
		end
	else
		local rate = math.random(1, 100)
		if rate <= 75 then
			if protectListCount > 0 then
				local W = math.random(0, protectListCount - 1);
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList[W] , 5182, 0);	
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		else		
			if actorListCount > 0 then	
				local T = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		end
	end
end 