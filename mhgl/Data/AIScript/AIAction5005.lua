--挑战山庄 姬悲情 AI

function AIAction5005(battle, mob)

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
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex() and actor:GetHP() <= 0.5 * actor:GetMaxHP())  then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end
	end

	if protectListCount2 > 0 then
		local U = math.random(0, protectListCount2 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[U], 5182, 0);
	elseif actorListCount > 0 then
		local R = math.random(0, actorListCount - 1);
		local Rate = math.random(1, 100);
		if Rate <= AtkRate then--atk 25%
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		elseif  Rate <= SkillRate then --skill 100%
			local randomSkill = mob:GetRandomSkill();
			local S = math.random(0, protectListCount - 1); 
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill)
				if csv ~= nil then
					if csv.targetType == 4 then
						mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], randomSkill, 0)
					elseif csv.targetType == 5 then
						mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0)
					end
				end
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0)
			end
		end
	else
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	end
end