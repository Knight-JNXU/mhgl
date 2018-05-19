function AIAction4046(battle, mob)	
	
	
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
		
		--气撼九重天目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
			not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
			not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
			not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end
		
		--回龙克敌术目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and actor:GetFaction() == 1 and actor:GetCclass() == 1) then
			actorList2[actorListCount2] = actor:GetIndex();
			actorListCount2 = actorListCount2 + 1;
		end
		
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--先声夺人目标选择列表
		--[[if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and 
			actor:GetIndex() == mob:GetIndex() and not actor:IsBuffExist(2100)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end]]
		
		--金光云拂目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1501)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end						
	end
	
	local Rate = math.random(1, 100);
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
			local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
	               	if csv.id == 5064 then
						if actorListCount1 > 0 then
							local S = math.random(0, actorListCount1 - 1);								
							mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], randomSkill, 0);									
						else
							mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end					
					elseif csv.id == 5260 then							
						if actorListCount2 > 0 and not mob:IsBuffExist(1808) then
							local T = math.random(0, actorListCount2 - 1);								
							mob:InputCommand(LuaI.BATCMD_SKILL, actorList2[T], randomSkill, 0);									
						else
							mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end	
					elseif csv.id == 5063 then		
						if protectListCount1 > 0 then
							local U = math.random(0, protectListCount1 - 1);								
							mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[U], randomSkill, 0);									
						else
							mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end	
					elseif csv.id == 5065 then		
						if protectListCount2 > 0 then
							local V = math.random(0, protectListCount2 - 1);								
							mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[V], randomSkill, 0);									
						else
							mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end	
					else
						if atkActor ~= -1 then
							mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, randomSkill, 0);
						else
							mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0);
						end		
					end
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
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
	end
	
end 