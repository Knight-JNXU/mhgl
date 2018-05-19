function AIAction4042(battle, mob)	
	
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local actorList2 = {};
	local actorListCount2 = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
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
		
		--闭穴绝手、散元幽心、惊神断魄、点穴截脉、弛纵心猿秘法目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--盗贼职业判定
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetCclass() == 2) then
			targetclass = 2;
		end
		
		--医生职业判定
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetCclass() == 3) then
			targetclass = 3;
		end
										
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--凝血术目标选择列表	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1202)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
	end
	
	local Rate = math.random(1, 100);
	if targetclass == 1 then
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			local xkskill = math.random(1, 100);
			if xkskill <= 50 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5044, 0);
			else
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5040, 0);
			end
		end
	elseif targetclass == 2 then
		local dzskill = math.random(1, 100);
		if dzskill <= 30 then
			if actorListCount1 > 0 then
				local S = math.random(0, actorListCount1 - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5162, 0);
			elseif actorListCount > 0 then
				local T = math.random(0, actorListCount - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5164, 0);
			end
		else
			if actorListCount > 0 then
				local U = math.random(0, actorListCount - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[U], 5164, 0);
			end
		end
	else
		local ysskill = math.random(1, 100);	
		if ysskill <= 25 then
			if protectListCount1 > 0 then
				local V = math.random(0, protectListCount1 - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[V], 5221, 0);
			elseif actorListCount > 0 then
				local W = math.random(0, actorListCount - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[W], 5220, 0);
			end
		elseif ysskill <= 50 then
			if actorListCount1 > 0 then
				local X = math.random(0, actorListCount1 - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[X], 5223, 0);
			elseif actorListCount > 0 then
				local Y = math.random(0, actorListCount - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[Y], 5220, 0);
			end
		else
			if actorListCount > 0 then
				local Z = math.random(0, actorListCount - 1); 
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[Z], 5220, 0);
			end
		end
	end
end 