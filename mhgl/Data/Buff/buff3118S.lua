--MOB在非封印状态下，近身攻击者会遭到睡眠状态的反馈

function buff3118Active(buff, Char, Other, Type) 
	
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
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 and
				Other:IsBuffExist(1103) ~= true and 	--银贼内封
				Other:IsBuffExist(1104) ~= true and		--唐贼内封
				Other:IsBuffExist(1105) ~= true and 	--圣贼内封降防御				
				Other:IsBuffExist(1106) ~= true and		--六扇双封
				Other:IsBuffExist(1107) ~= true and 	--十二侠双封
				Other:IsBuffExist(1108) ~= true and		--十二刺双封
				Other:IsBuffExist(1109) ~= true and 	--唐贼双封
				Other:IsBuffExist(1110) ~= true and		--圣医全封
				Other:IsBuffExist(1111) ~= true and 	--圣贼全封
				Other:IsBuffExist(1113) ~= true and		--混乱
				Other:IsBuffExist(1114) ~= true and		--勾魂
				Other:IsBuffExist(1116) ~= true then	--圣贼内封降内功
																
				--[[if not Other:IsBuffExist(1601) and 
				not Other:IsBuffExist(1628) and  
				not Other:IsBuffExist(2020) and 
				not Other:IsBuffExist(2023) and 
				not Other:IsBuffExist(2024) and  
				not Other:IsBuffExist(2053) and 
				not Other:IsBuffExist(2056) then
					Other:AddBuff(1111, 0, 0, 0, 100, 100);					
				end	]]--
				Other:AddBuff(1111, 1, 1, 0, 100, 100);	
			end			
		end		
	end	
end
