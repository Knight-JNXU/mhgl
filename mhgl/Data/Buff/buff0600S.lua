--降防御20% 增加攻击、内功10%

function buff0600Attri(Char, buff, Attri) 
	
	Attri:SetDef(Attri:GetDef() * 0.8)
	Attri:SetAtk(Attri:GetAtk() * 1.1)
	Attri:SetPow(Attri:GetPow() * 1.1)
	--Char:AddBuff(603, 0, 0, 0, 3, 100)
	
end

function buff0600Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
	
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
			Other:GetAction() == LuaI.BATCMD_SPECIAL) and (SkillForm == 1 or SkillForm == 2))) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			if not Char:IsBuffExist(603) then
				Char:AddBuff(603, 0, 1, 0, 3, 100)
			else
				local buffData = Char:FindBuff(603)
				if buffData ~= nil then
					Char:AddBuff(603, 0, buffData:GetBuffValue2()+ 1, 0, 3, 100)
					--buffData:GetBuffValue2()
				end
			end
		end
	end
end

function buff0600Remove(buff,Char)

	if Char:IsBuffExist(603) then
		Char:RemoveBuff(603)
	end
	
end

