--挑战山庄 姬苦情 AI
--如果玩家身上有反间计就使用法术，反之使用法术和上古灵符。

function AIAction5003(battle, mob)	
	
	
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
		--敌方所有有效目标选择列表 气憾九重天
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) and not actor:IsBuffExist(1113) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
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
	local T = math.random(0, actorListCount1 - 1);
	local Rate = math.random(1, 100)
	if turn % 4 == 0 and turn ~= 0 then
		if  actorListCount1 > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], 5064, 0);
		elseif actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6515, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif turn % 4 == 1  then
		if actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif turn % 4 == 2  then
		if actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5253, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	elseif turn % 4 == 3  then
		if actorListCount > 0 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6515, 0)
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 