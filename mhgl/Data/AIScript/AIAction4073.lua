--元旦活动MOB“友好的雪人”AI

function AIAction4073(battle, mob)	
	
	
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
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--检测友好的雪人是否在战场		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:IsValidTarget() and actor:HasSkill(5661) and actor:GetHP() > 0) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
		
		--检测友好的雪人是否死亡		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:GetIndex() ~= mob:GetIndex() and actor:IsValidTarget() and actor:HasSkill(5661) and actor:GetHP() == 0) then
			protectList1[protectListCount1] = actor:GetIndex();
			protectListCount1 = protectListCount1 + 1;
		end		
	end

	if protectListCount > 0 then			
		mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);				
	else
		local S = math.random(0, actorListCount - 1)			
		if math.random(1, 100) <= 75 then
			local randomSkill = mob:GetRandomSkill();
			if randomSkill ~= 0 then
				local csv = mob:GetSkillCsvData(randomSkill);
				if csv ~= nil then																			
					mob:InputCommand(LuaI.BATCMD_SKILL, actorList[S], randomSkill, 0);
				else
					mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);						
				end	
			else
				mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
			end
		else
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
		end
	end	
	
end 