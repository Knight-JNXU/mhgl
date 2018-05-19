function AIAction4004(battle, mob)	
	--跑镖MOB组合技能的喽啰
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			not actor:IsBuffExist(1515)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex()) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end
	end
	
	local R = math.random(0, actorListCount - 1);
	if battle:GetCurTurn() == 1 then
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	else
		if protectListCount >= 3 then
			if protectListCount1 >= 3 then
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[0], 5277, 0);			
			elseif protectListCount1 > 0 and protectListCount1 < 3 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	end
	
	
	
	--[[local Rate = math.random(1, 100);
	if actorListCount > 0 then
		local R = math.random(0, actorListCount - 1);
		if Rate <= AtkRate then -- atk 30%
			if atkActor ~= -1 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > AtkRate and Rate <= SkillRate then --skill 70%
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				if atkActor ~= -1 then
					mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, randomSkill, 0);
				else
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0);
				end				
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > SkillRate and Rate <= DefRate then --def 0%
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		elseif Rate > DefRate and Rate <= ProtectRate then -- protect 0%
			if protectListCount > 0 then
				if protectActor ~= -1 then
					mob:InputCommand(LuaI.BATCMD_PROTECT, protectActor, 0, 0);
				else
					local P = math.random(0, protectListCount - 1);
					mob:InputCommand(LuaI.BATCMD_PROTECT, protectList[P], 0, 0);
				end
			elseif protectListCount == 0 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > ProtectRate and Rate <= ExcapeRate then --esc 0%
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end]]
	
end 