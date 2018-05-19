function AIAction4005(battle, mob)
	--大侠帮助新手过剧情AI
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local Skill = mob:GetSkillLv(5300);
	local atkActor = -1;
	local protectActor = -1;	
	
	local AtkRate = 0;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	if mob:GetSP() < 1 then
		AtkRate = 40;
		SkillRate = 40;
		DefRate = 100;
		ProtectRate = 100;
		ExcapeRate = 100;
	end
		
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1113)) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsPlayer() and actor:IsDead()) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		
	end
	
	local R = math.random(0, actorListCount - 1);
	local S = math.random(0, protectListCount - 1);	
	if battle:GetCurTurn() == 1 then
		if mob:GetMob_id() == 1001 then 
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5278, 0);
		elseif mob:GetMob_id() == 1002 or mob:GetMob_id() == 1003 or mob:GetMob_id() == 1004 then
			if math.random(1,100) < 50 then
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5278, 0);
			else
				if actorListCount > 0 then
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			end
		elseif mob:GetMob_id() == 1005 or mob:GetMob_id() == 1006 then
			if math.random(1,100) < 10 then
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5278, 0);
			else
				if actorListCount > 0 then
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			end
		else
			if math.random(1,100) < 2 then
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5278, 0);
			else
				if actorListCount1 > 0 then
					local U = math.random(0, actorListCount1 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[U], 5064, 0);
				end
			end
		end
	elseif math.fmod(battle:GetCurTurn(),5) == 0 then
		if protectListCount1 > 0 then
			local T = math.random(0, protectListCount1 - 1);
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5186, 0);
		else
			if actorListCount > 0 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		end
	else	
		local SaveRate = math.random(1,100);
		if protectListCount1 > 0 then
			if mob:GetMob_id() == 1001 then
				local T = math.random(0, protectListCount1 - 1);
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5186, 0);
			elseif mob:GetMob_id() == 1002 or mob:GetMob_id() == 1003 or mob:GetMob_id() == 1004 then
				local T = math.random(0, protectListCount1 - 1);
				if SaveRate < 50 then
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5186, 0);
				else
					if actorListCount > 0 then
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
					end
				end 
			elseif mob:GetMob_id() == 1005 or mob:GetMob_id() == 1006 then
				local T = math.random(0, protectListCount1 - 1);
				if SaveRate < 20 then
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5186, 0);
				else
					if actorListCount > 0 then
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
					end
				end
			else
				local T = math.random(0, protectListCount1 - 1);
				if SaveRate < 5 then
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5186, 0);
				else
					if actorListCount > 0 then
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
					end
				end
			end
		else
			if SaveRate < 36 then
				if actorListCount > 0 then
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			else
				if actorListCount1 > 0 then
					local U = math.random(0, actorListCount1 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[U], 5064, 0);
				else
					mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end
			end
		end
	end
end 