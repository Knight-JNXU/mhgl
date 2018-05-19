--ÀëÐÄ´ó½ûÖÆ

function buff1126Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		
		local SkilltargetType = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkilltargetType = csv.targetType;
		end
		
		if Char:GetCommand() == LuaI.BATCMD_ATTACK then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();
			
			for i = 0, actorCount - 1 do
				
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if (actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					
					if actor:GetIndex() ~= Char:GetIndex() then
						Char:InputCommand(LuaI.BATCMD_ATTACK, actor:GetIndex(), 0, 0);
						Char:IgnoreTeam(true);
						break
					end
				end
			end
		elseif Char:GetCommand() == LuaI.BATCMD_SKILL and (SkilltargetType == 5 or SkilltargetType == 10) then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();
			
			for i = 0, actorCount - 1 do
				
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if (actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					
					if actor:GetIndex() ~= Char:GetIndex() then
						Char:InputCommand(LuaI.BATCMD_SKILL, actor:GetIndex(), Char:GetSubType(), 0);
						Char:IgnoreTeam(true);
						break
					end
				end
			end
		elseif Char:GetCommand() == LuaI.BATCMD_SKILL and SkilltargetType == 4 then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();
			
			for i = 0, actorCount - 1 do
				
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if (actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
					
					Char:InputCommand(LuaI.BATCMD_SKILL, actor:GetIndex(), Char:GetSubType(), 0);
					Char:IgnoreTeam(true);
					break
				end
			end
		elseif Char:GetCommand() == LuaI.BATCMD_SPECIAL and (SkilltargetType == 5 or SkilltargetType == 10) then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();
			
			for i = 0, actorCount - 1 do
				
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if (actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					
					if actor:GetIndex() ~= Char:GetIndex() then
						Char:InputCommand(LuaI.BATCMD_SPECIAL, actor:GetIndex(), Char:GetSubType(), 0);
						Char:IgnoreTeam(true);
						break
					end
				end
			end
		elseif Char:GetCommand() == LuaI.BATCMD_SPECIAL and SkilltargetType == 4 then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();
			
			for i = 0, actorCount - 1 do
				
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if (actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
					
					Char:InputCommand(LuaI.BATCMD_SPECIAL, actor:GetIndex(), Char:GetSubType(), 0);
					Char:IgnoreTeam(true);
					break
				end
			end
		end
	end
end
