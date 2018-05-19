--MOB万毒萦绕反馈一个随机敌方单位

function buff3109Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
				((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and 
				SkillForm == 1)) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 then
												
				local battle = Char:GetBattle();
				local actorCount = battle:GetActorCount();
				local r = math.random(1, actorCount - 1);
				local index = Char:GetIndex();
				local Lv = Char:GetLevel();
				
				if not Other:IsBuffExist(1002) then
					Other:AddBuff(1002, (Lv + 10), 0, 0, 5, 100);
				end
				--[[for i = 0, actorCount - 1 do		
					local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
					if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:GetIndex() ~= Other:GetIndex() and actor:IsValidTarget() and not actor:IsBuffExist(1002)) then
						actor:AddBuff(1002, (Lv + 10), 0, 0, 5, 100);
						actor:SetTempReaction(LuaI.BATCMD_NORM_HIT);
						battle:PushExtraActor(actor);
						break
					end
				end	]]				
			end			
		end		
	end	
end
