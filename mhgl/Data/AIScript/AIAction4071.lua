--元旦活动MOB“朱停的仆人”AI

function AIAction4071(battle, mob)	
	
	
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
	local protectList4 = {};
	local protectListCount4 = 0;
		
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--己方三针合一所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:IsValidTarget() and not actor:IsBuffExist(1504)) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
		
		--己方融合所有有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:IsValidTarget() and actor:IsBuffExist(3142)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
		
		--己方有友好雪人的有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:HasSkill(5661) and actor:GetHP() > 0) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;
		end		
		
		--己方有顽皮雪人的有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:HasSkill(5662)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;
		end	
		
		--己方有顽皮雪人的有效目标选择列表		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:GetHP() > 0) then
			protectList4[protectListCount4] = actor:GetIndex();
			protectListCount4 = protectListCount4 + 1;
		end	
	end	
	
	if protectListCount4 == 0 then
		mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
	elseif protectListCount1 >= 2 then
		local R = math.random(0, protectListCount - 1);	
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList[R], 6253, 0);	
	elseif protectListCount2 or protectListCount3 > 0 then
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
	else
		local S = math.random(0, actorListCount - 1);	
		if math.random(1, 100) <= 75 then
			mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 6251, 0);	
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);	
		end
	end
	
end 