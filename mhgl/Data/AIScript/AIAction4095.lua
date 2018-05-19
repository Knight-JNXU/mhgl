--帮派副本战斗：帮派强盗头目&帮派内贼头目_AI
function AIAction4095(battle, mob)	
	
	
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
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--神灵归元术目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsDead()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end			
	end
	
	local R = 0
	local S = 0
	if actorListCount > 0 then
		R = math.random(0, actorListCount - 1);
	end
	if protectListCount > 0 then
		S = math.random(0, protectListCount - 1);
	end
	
	if protectListCount > 0 then
		if math.random(1, 100) <= 15 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5186, 0);	
		else
			if actorListCount > 0 then
				if math.random(1, 100) <= 90 then
					if mob:HasSkill(6225) then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6225, 0);
					elseif mob:HasSkill(5020) then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5020, 0);
					else
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
					end
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		end
	elseif actorListCount > 0 then
		if math.random(1, 100) <= 90 then
			if mob:HasSkill(6225) then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6225, 0);
			elseif mob:HasSkill(5020) then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5020, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end 