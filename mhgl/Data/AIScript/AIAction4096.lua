--帮派副本战斗：幕后主使_AI
--辅助召唤怪物
function AIAction4096(battle, mob)	
	
	
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
		
		--己方目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end			
		
		
		
		--五湖四海目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() == mob:GetIndex()) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end	
	end
	
	local R = 0
	local S = 0
	local T = 0
	local CT = battle:GetCurTurn() 
	
	if actorListCount > 0 then
		R = math.random(0, actorListCount - 1);
	end
	if protectListCount > 0 then
		S = math.random(0, protectListCount - 1);
	end
	if protectListCount1 > 0 then
		T = math.random(0, protectListCount1 - 1);
	end
	
	if math.fmod(CT, 5) == 1 then
		if protectListCount > 1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5183, 0);	
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif math.fmod(CT, 5) == 2 then
		if protectListCount > 1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5184, 0);	
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif math.fmod(CT, 5) == 3 then
		if protectListCount > 1 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[S], 5185, 0);	
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif math.fmod(CT, 5) == 0 then
		if protectListCount1 > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[T], 5293, 0);	
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	else
		if protectListCount > 1 then
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	end
end 