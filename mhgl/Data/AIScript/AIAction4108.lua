

function AIAction4108(battle, mob)	
	
	
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
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and
			actor:GetIndex() ~= mob:GetIndex() and actor:HasBuff(1539) and actor:GetHP() ~= 0 ) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
	end
	local turn = battle:GetCurTurn()
	if protectListCount1 > 0 and turn % 4 == 0 and turn ~= 0 then
		local T = math.random(0, protectListCount1 - 1);
		mob:InputCommand(LuaI.BATCMD_ATTACK, protectList1[T], 0, 0);	
	elseif actorListCount > 0 then	
		local S = math.random(0, protectListCount - 1);
		local R = math.random(0, actorListCount - 1);
		local Rate = math.random(1, 100)
		if Rate <= AtkRate then--atk 0%
			if atkActor ~= -1 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end			       													
		elseif  Rate <= SkillRate then
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
					if csv.targetType == 4 then
						if protectActor ~= -1 then
							mob:InputCommand(LuaI.BATCMD_SKILL, protectActor, randomSkill, 0);
						else
							mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], randomSkill, 0);
						end
					
					elseif csv.targetType == 5 then
						if atkActor ~= -1 then
							mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, randomSkill, 0);
						else
							mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0);
						end	
					end
				end	
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
	end	
end 