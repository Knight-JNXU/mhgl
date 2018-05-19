--大侠试炼“傅红雪”

function AIAction4077(battle, mob)	
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
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end															
	end
		
	if mob:IsBuffExist(3108) then
		local R = math.random(0, actorListCount - 1)
		mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6204, 0);
	elseif mob:IsBuffExist(3147) or mob:IsBuffExist(4001) then
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	elseif mob:IsBuffExist(4000) then
		local R = math.random(0, actorListCount - 1)
		mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6204, 0);
	else
		local R = math.random(0, actorListCount - 1)
		if math.random(1, 100) <= 75 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6204, 0);
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		end
	end
end 