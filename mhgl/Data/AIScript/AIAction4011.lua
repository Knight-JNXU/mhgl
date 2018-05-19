function AIAction4011(battle, mob)	
	
	
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
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 7 and actor:GetCclass() == 4) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--凤飞羽散目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1200) or
			actor:IsBuffExist(1201) or actor:IsBuffExist(1202) or actor:IsBuffExist(1203) or actor:IsBuffExist(1500) or 
			actor:IsBuffExist(1501) or actor:IsBuffExist(1503) or actor:IsBuffExist(1504) or actor:IsBuffExist(1505) or 
			actor:IsBuffExist(1506) or actor:IsBuffExist(1507) or actor:IsBuffExist(1803) or actor:IsBuffExist(1806))) then
			actorList2[actorListCount2] = actor:GetIndex();
			actorListCount2 = actorListCount2 + 1;
		end
		
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--翠烟遁形目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:IsPlayer() and (not actor:IsBuffExist(1700) and not actor:IsBuffExist(1701))) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end				
	end
	
	if battle:GetCurTurn() == 1 then
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5044, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 2 then
		if actorListCount > 0 then
			local U = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[U], 5040, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 3 then
		if actorListCount > 0 then
			local V = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[V], 5043, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif battle:GetCurTurn() == 4 then
		if actorListCount2 > 0 then
			local S = math.random(0, actorListCount2 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList2[S], 5045, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif battle:GetCurTurn() == 5 then
		if protectListCount1 > 0 then
			local T = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5046, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end		
end 