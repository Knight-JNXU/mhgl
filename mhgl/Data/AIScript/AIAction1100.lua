function AIAction1100(battle, mob)	
	--特殊AI，100%出招式
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 40;
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
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() --and 
			--actor:GetIndex() ~= mob:GetIndex()
			) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
	end
	
	local Rate = math.random(1, 100);
	if actorListCount > 0 then
		local R = math.random(0, actorListCount - 1);
		local S = math.random(0, protectListCount - 1);
		if Rate <= AtkRate then--atk 0%
			if atkActor ~= -1 then
				mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > AtkRate and Rate <= SkillRate then --skill 60%
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
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
			end
		elseif Rate > SkillRate and Rate <= DefRate then
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		elseif Rate > DefRate and Rate <= ProtectRate then
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
		elseif Rate > ProtectRate and Rate <= ExcapeRate then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
	
end