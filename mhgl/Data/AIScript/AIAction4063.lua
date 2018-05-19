function AIAction4063(battle, mob)	
	
	
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
		
		--特定攻击目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget() and not actor:IsPlayer() and not actor:IsParnter()) then
			--if actor:GetMob_id() == 22016 or actor:GetMob_id() == 22032 then
				actorList1[actorListCount1] = actor:GetIndex();
				actorListCount1 = actorListCount1 + 1;
			--end
		end
		
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
	end
	
	if mob:GetMob_id() == 22037 then
		if battle:GetCurTurn() == 1 then
			if protectListCount > 0 then
				local U = math.random(0, protectListCount - 1);
				mob:InputCommand(LuaI.BATCMD_SKILL, protectList[U], 6249, 0);
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end	
		else		
			if actorListCount1 > 0 then	
				local S = math.random(0, actorListCount1 - 1);			
				if battle:GetCurTurn() == 2 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 6240, 0);
				elseif battle:GetCurTurn() == 3 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 6246, 0);
				elseif battle:GetCurTurn() == 4 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 6242, 0);
				elseif battle:GetCurTurn() == 5 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 6243, 0);
				elseif battle:GetCurTurn() == 6 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 6248, 0);
				else
					mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end	
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end	
		end
	elseif  mob:GetMob_id() == 22038 then
		if battle:GetCurTurn() == 1 then
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		else
			if actorListCount1 > 0 then	
				local T = math.random(0, actorListCount1 - 1);
				if battle:GetCurTurn() == 2 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 6239, 0);
				elseif battle:GetCurTurn() == 3 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 6241, 0);
				elseif battle:GetCurTurn() == 4 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 6244, 0);
				elseif battle:GetCurTurn() == 5 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 6245, 0);
				elseif battle:GetCurTurn() == 6 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 6247, 0);
				else
					mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end	
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end	
		end
	elseif mob:GetMob_id() == 3238 then
		if actorListCount1 > 0 then	
			
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[5], randomSkill, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	elseif mob:GetMob_id() == 3236 or mob:GetMob_id() == 3235 then
		if battle:GetCurTurn() > 5 then
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		
		elseif actorListCount1 > 0 then	
			local R = math.random(0, actorListCount1 - 1);
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[R], randomSkill, 0);
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
				end
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end		
	else						
		if battle:GetCurTurn() >= 3 then
			mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
		else
			if actorListCount1 > 0 then	
				local R = math.random(0, actorListCount1 - 1);
				local randomSkill = mob:GetRandomSkill();
				if randomSkill ~= 0 then
					local csv = mob:GetSkillCsvData(randomSkill);
		            if csv ~= nil then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[R], randomSkill, 0);
					else
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
					end
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
				end
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end			
		end
	end
end 