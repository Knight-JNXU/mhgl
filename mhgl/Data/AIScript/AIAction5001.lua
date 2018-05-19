--挑战山庄 玉剑公主 AI

function AIAction5001(battle, mob)	
	
	
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
		--己方所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end			
	end
	local turn = battle:GetCurTurn()
	local R = math.random(0, actorListCount - 1);
	local S = math.random(0, protectListCount - 1);
	if actorListCount > 0 and turn % 4 == 0 and turn ~= 0  then
		if atkActor ~= -1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, 6000, 0);
		else
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6000, 0);
		end	
	elseif actorListCount > 0 and turn % 4 == 1 then	
		if atkActor ~= -1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, 5050, 0);
		else
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5050, 0);
		end	
	elseif actorListCount > 0 and turn % 4 == 2 then	
		if atkActor ~= -1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, 5250, 0);
		else
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5250, 0);
		end	
	elseif actorListCount > 0 and turn % 4 == 3 then	
		if atkActor ~= -1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, atkActor, 6205, 0);
		else
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6205, 0);
		end	
	end
end 