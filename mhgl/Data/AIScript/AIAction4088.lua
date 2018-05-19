--主线任务，“春花”AI

function AIAction4088(battle, mob)
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;	
	local protectList = {};
	local protectListCount = 0;
	local protectList1 = {};
	local protectListCount1 = 0;
	local protectList2 = {};
	local protectListCount2 = 0;
	local protectList3 = {};
	local protectListCount3 = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;			
		end
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;		
		end		
		
		--三阳玄针目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and not actor:IsBuffExist(1505)) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;		
		end	
		
		--三阴玄针目标选择列表
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and not actor:IsBuffExist(1506)) then
			protectList2[protectListCount2] = actor:GetIndex();
			protectListCount2 = protectListCount2 + 1;		
		end	
		
		--天魔刀的丁鹏是否在场
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex() and actor:HasSkill(6232)) then
			protectList3[protectListCount3] = actor:GetIndex();
			protectListCount3 = protectListCount3 + 1;		
		end	
	end
	
	if protectListCount1 > 0 then
		local R = math.random(0, protectListCount1 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5183, 0);
	elseif protectListCount2 > 0 then
		local S = math.random(0, protectListCount2 - 1);
		mob:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5185, 0);
	else
		if actorListCount > 0 then
			local T = math.random(0, actorListCount - 1);
			if protectListCount3 > 0 then
				local skilluse = math.random(1, 7)
				if skilluse == 1 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5250, 0);
				elseif skilluse == 2 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5251, 0);
				elseif skilluse == 3 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5252, 0);	
				elseif skilluse == 4 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5253, 0);
				elseif skilluse == 5 then
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 5254, 0);
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
				end
			else					
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 