--挑战山庄 林小仙 AI

function AIAction5006(battle, mob)
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local Skill = mob:GetSkillLv(5300);
	local atkActor = -1;
	local protectActor = -1;	
	
	local AtkRate = 25;
	local SkillRate = 100;
	local DefRate = 100;
	local ProtectRate = 100;
	local ExcapeRate = 100;

	--[[if mob:GetSP() < 1 then
		AtkRate = 40;
		SkillRate = 40;
		DefRate = 100;
		ProtectRate = 100;
		ExcapeRate = 100;
	end]]
	
	if mob:GetMob_id() == 1011 or mob:GetMob_id() == 1011 then
		AtkRate = 10;
		SkillRate = 100;
	end
	
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
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex()) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() and actor:GetHP() <= 0.3 * actor:GetMaxHP()) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end
	end
		
	
	if protectListCount2 > 0 then 
		mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
	else
		local Rate = math.random(1, 100);
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);	
			local S = math.random(0, protectListCount - 1);
			local T = math.random(0, protectListCount1 - 1);
			
			if Rate <= AtkRate then--atk 0%
				if atkActor ~= -1 then
					mob:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
				end
			elseif Rate > AtkRate and Rate <= SkillRate then --skill 100%
				if mob:IsBuffExist(1103) or mob:IsBuffExist(1104) or mob:IsBuffExist(1105) or mob:IsBuffExist(1116) or mob:IsBuffExist(1809) then				
					if mob:IsBoss() or (mob:GetMob_id() >= 2010 and mob:GetMob_id() <= 2042) then
						local pugongrate = math.random(1, 100)
						if pugongrate <= 80 then
							mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						else
							mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
						end
					end
				else
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
							elseif csv.targetType == 1 then
								mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], randomSkill, 0);
							end
						end	
					else
						mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
					end
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
end 