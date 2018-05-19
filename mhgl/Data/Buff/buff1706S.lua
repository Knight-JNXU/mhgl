--½£ËøÓ°²ø(Ò»Ëù)

function buff1706Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		
		local skilltargetType = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			skilltargetType = csv.targetType;
		end
		
		if (Char:GetCommand() == LuaI.BATCMD_ATTACK or (Char:GetCommand() == LuaI.BATCMD_SKILL and 
			skilltargetType == 5)) and (Char:IsBuffExist(1113) or Char:IsBuffExist(1114)) ~= true then
			
			local battle = Char:GetBattle();
			local pos = buff:GetBuffValue2();
			local Dteam = 1 - Char:GetTeam();
			local actor = battle:GetActorByPosition(pos, Dteam);
			
			if (actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
				
				if math.random(1, 100) < 101 then
					Char:InputCommand(Char:GetCommand(), actor:GetIndex(), Char:GetSubType(), 0);
				end
			end
		end
	end
end
