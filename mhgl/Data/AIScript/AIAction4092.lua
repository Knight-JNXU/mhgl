--兵器谱“赠礼之剑”

function AIAction4092(battle, mob)	
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
		
		--友方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsPlayer()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end															
	end
	
	if mob:IsBuffExist(4001) or mob:IsBuffExist(3148) then
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	else
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1)
			local skillsel = math.random(1, 5)
			if skillsel == 1 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6257, 0);
			elseif skillsel == 2 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6258, 0);
			elseif skillsel == 3 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6259, 0);
			elseif skillsel == 4 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6260, 0);
			elseif skillsel == 5 then
				mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6261, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 