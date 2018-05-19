--大侠试炼“胡铁花”

function AIAction4074(battle, mob)	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	local actorList1 = {};
	local actorListCount1 = 0;
	local actorList2 = {};
	local actorListCount2 = 0;
	local actorList3 = {};
	local actorListCount3 = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local protectList3 = {};
	local protectListCount3 = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--喝酒有效目标选择	
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() == mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end						
		
		--玩家角色为男性	
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsPlayer()) then
			actorList1[actorListCount1] = actor:GetIndex();
			actorListCount1 = actorListCount1 + 1;
		end						
	end
	
	if mob:IsBuffExist(4000) then
		if battle:GetCurTurn() == 1 then
			local R = math.random(0, protectListCount - 1)		
			mob:InputCommand(LuaI.BATCMD_SKILL, protectList[R], 6255, 0);
		else
			if actorListCount1 > 0 then
				local S = math.random(0, actorListCount1 - 1)	
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 4501, 0);
			else
				mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end
		end
	else
		local T = math.random(0, actorListCount - 1)	
		if math.random(1, 100) <= 75 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 4501, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
		end
	end
end 