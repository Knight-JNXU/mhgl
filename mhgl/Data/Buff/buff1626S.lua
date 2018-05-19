--伤害反馈

function buff1626Active(buff, Char, Other, Type) 
	
	if Type == DO_ACTION then
		local battle = Char:GetBattle();
		local actorCount = battle:GetActorCount();
		local actorList = {};
		local actorListCount = 0;
		local protectList = {};
		local protectListCount = 0;
		
		for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);
			
			--敌方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
				actorList[actorListCount] = actor:GetIndex();
				actorListCount = actorListCount + 1;
			end
			
			--己方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
				protectList[protectListCount] = actor:GetIndex();
				protectListCount = protectListCount + 1;
			end		
		end
		
		if protectListCount == 1 then
			Char:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);				
		else
			Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end	
	end

	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end		
		if Char:GetTeam() ~= Other:GetTeam() then			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK) and  reDam1 > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				local battle = Char:GetBattle();
				local actorCount = battle:GetActorCount();
				local r = math.random(1, actorCount - 1);
				local index = Char:GetIndex();								
				for i = 0, actorCount - 1 do		
					local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
					if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
						actor:ChangeHp(-0.2 * actor:GetHP());
						actor:SetTempReaction(LuaI.BATCMD_NORM_HIT);
						battle:PushExtraActor(actor);
						--break
					end
				end	
			elseif (Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and reDam1 > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				local battle = Char:GetBattle();
				local actorCount = battle:GetActorCount();
				local r = math.random(1, actorCount - 1);
				local index = Char:GetIndex();
				for i = 0, actorCount - 1 do		
					local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
					if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:GetIndex() == Other:GetIndex() and actor:IsValidTarget()) then
						actor:ChangeHp(-0.2 * actor:GetHP());
						actor:SetTempReaction(LuaI.BATCMD_NORM_HIT);
						battle:PushExtraActor(actor);
						--break
					end
				end							
			end			
		end		
	end	
end
	
	

