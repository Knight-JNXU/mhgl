function AIAction4103(battle, mob)
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local protectList = {};
	local protectListCount = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 30;
	local SkillRate = 100;
	local DefRate = 0;
	local ProtectRate = 0;
	local ExcapeRate = 0;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and 
			actor:HasBuff(1538)) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
			
			--[[if actor:GetHP() < actor:GetMaxHP() * 0.5 then
				AtkRate = 10;
				SkillRate = 90;
				DefRate = 90;
				ProtectRate = 100;
				ExcapeRate = 100;
				
				protectActor = actor:GetIndex();
			end]]
		end
	end
	
	local Rate = math.random(1, 100);
	if actorListCount > 0 then
		if actorListCount1 >0 then
			R = math.random(0, actorListCount1 - 1)
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[R], 5060, 0)
		else
			local R = math.random(0, actorListCount - 1);
			if Rate <= AtkRate then --atk 60%
				if atkActor ~= -1 then
					mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			elseif Rate > AtkRate and Rate <= SkillRate then --skill 30%
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
			end
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end