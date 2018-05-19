--´íÂÒ(ÂÒÐÄ½Ù)
--[[
function buff1119Add(buff, Char) 
	local AI = "Deviation";
	Char:SetAIType(AI);
	Char:IgnoreTeam(true);
end

function buff1119Remove(buff, Char) 
	local AI = "";
	Char:SetAIType(AI);
	Char:IgnoreTeam(false);
end
]]
function buff1119Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		
		local SkilltargetType = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkilltargetType = csv.targetType;
		end
		
		if Char:GetCommand() == LuaI.BATCMD_ATTACK or ((Char:GetCommand() == LuaI.BATCMD_SKILL or 
			Char:GetCommand() == LuaI.BATCMD_SPECIAL) and (SkilltargetType == 5 or SkilltargetType == 10 )) then
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
		end
	end
end
