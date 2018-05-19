function AIAction4104(battle, mob)
	--舍己型
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 80;
	local DefRate = 0;
	local ProtectRate = 100;
	local ExcapeRate = 0;

	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		--[[if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex() and (not actor:HasSkill(5300))) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
			
			if actor:GetHP() < actor:GetMaxHP() * 0.5 then
				AtkRate = 10;
				SkillRate = 90;
				DefRate = 90;
				ProtectRate = 100;
				ExcapeRate = 100;
				
				protectActor = actor:GetIndex();
			end
		end]]
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() ~= mob:GetIndex() and actor:HasSkill(5300)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
	end
	
	local Rate = math.random(1, 100);
	if actorListCount > 0 then
		local R = math.random(0, actorListCount - 1);
		if Rate <= AtkRate then 
			if atkActor ~= -1 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > AtkRate and Rate <= SkillRate then 
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
		elseif Rate > SkillRate and Rate <= ProtectRate then 
			if protectListCount1 == 0 then
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
			else
				local P = math.random(0, protectListCount1 - 1);
				mob:InputCommand(LuaI.BATCMD_PROTECT, protectList1[P], 0, 0);
			end
			--[[if protectList[0] ~= -1 then
				mob:InputCommand(LuaI.BATCMD_PROTECT, protectList[0], 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end]]
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end