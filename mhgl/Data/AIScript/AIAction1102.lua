function AIAction1102(battle, mob)	
	--特殊AI，100%出招式
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local protectList3 = {};
	local protectListCount3 = 0;
	local protectList4 = {};
	local protectListCount4 = 0;
	
	local atkActor = -1;
	local protectActor = -1;
	
	local AtkRate = 0;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;
	local X = 0;
	local Y = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if i ~= 0 and actor:GetTeam() == mob:GetTeam() and (actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or 
		actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) or actor:IsBuffExist(1109) or 
		actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1113) or 
		actor:IsBuffExist(1116) or actor:IsBuffExist(1103)) then
			X = X + 1;
		end
		if i ~= 0 and actor:GetTeam() == mob:GetTeam() and (actor:IsBuffExist(3057) or actor:IsBuffExist(3067)) then
			Y = Y + 1;
		end
		if actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5301) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end
		
		--三阴玄针目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1506)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
		--护体金针目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1504)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end						
		--玉冰障选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1806)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end	

		if actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() then
			protectList[protectListCount4] = actor:GetIndex();
			protectListCount4 = protectListCount4 + 1;
		end		
	end
	if mob:GetMob_id() == 30351 then
		if actorListCount > 0 then
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
					local S = math.random(0, protectListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], randomSkill, 0);
				end
			end
		end
	elseif mob:GetMob_id() == 30352 then
		if actorListCount > 0 then
			if not mob:IsBuffExist(1103) or not mob:IsBuffExist(1104) or not mob:IsBuffExist(1105) or not mob:IsBuffExist(1116)  then		
				local Skill = 0 
				local S = 0
				if protectListCount1 > 0 then
					Skill = 5185
					S = math.random(0, protectListCount1 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], Skill, 0);		
				elseif protectListCount2 > 0 then
					Skill = 5184
					S = math.random(0, protectListCount2 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], Skill, 0);	
				elseif protectListCount3 > 0 then
					Skill = 5201
					S = math.random(0, protectListCount3 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList3[S], Skill, 0);	
				else
					local T = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
				end
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0)
			end
		end
	elseif mob:GetMob_id() == 32120 then
		if actorListCount > 0 then		
			local Skill = 0;
			if X >= 2 and Y == 0 then
				Skill = 6206
				local csv = mob:GetSkillCsvData(Skill);				
				if csv ~= nil then
					S = math.random(0, protectListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], Skill, 0);
				end				
			else
				if math.random(1,100) < 60 then
					Skill = 5048
				else
					Skill = 5044
				end
				if Skill ~= 0 then
					local csv = mob:GetSkillCsvData(Skill);
					if csv ~= nil then
						local S = math.random(0, actorListCount - 1);
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], Skill, 0);
					end
				end
			end
		end
	elseif mob:GetMob_id() == 32021 or mob:GetMob_id() == 32022 then
		if actorListCount > 0 then	
			local Skill = 0;
			if mob:IsBuffExist(3120) or mob:IsBuffExist(3121) then
				local T = math.random(0, actorListCount - 1);
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);			
			elseif mob:IsBuffExist(4003) or (math.fmod(battle:GetCurTurn(),7) == 2 and mob:IsBuffExist(4000))then
				Skill = 6208
				local csv = mob:GetSkillCsvData(Skill);				
				if csv ~= nil then
					local S = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], Skill, 0);
				end			
			elseif math.fmod(battle:GetCurTurn(),7) == 3 then
				Skill = 6206
				local csv = mob:GetSkillCsvData(Skill);				
				if csv ~= nil then
					S = math.random(0, protectListCount4 - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], Skill, 0);
				end	
			else
				Skill = 6207
				local csv = mob:GetSkillCsvData(Skill);				
				if csv ~= nil then
					local S = math.random(0, actorListCount - 1);
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], Skill, 0);
				end	
			end			
		end	
	end
end 