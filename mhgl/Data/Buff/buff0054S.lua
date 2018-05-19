--·µÉú3

function buff0054Active(buff, Char, Other, Type) 

	if Type == DO_HITTING then
		
		local rec1 = -1 * Char:GetDHP();
		local rec2 = -1 * Char:GetDMHP();
		local rec3 = -1 * Char:GetDSP();
		local rec4 = -1 * Char:GetDMSP();
		
		if Char:GetTeam() == Other:GetTeam() then
			if (Char:GetAction() == LuaI.BATCMD_ITEM or Other:GetAction() == LuaI.BATCMD_ITEM) and
				(rec1 < 0 or rec2 < 0 or rec3 < 0 or rec4 < 0) then
				
				Char:ResetHP();
				Char:ResetMHP();
				Char:ResetSP();
				Char:ResetMSP();
				Char:ChangeHp(-1 * rec1 / 2);
				Char:ChangeMHp(-1 * rec2 / 2);
				Char:ChangeSp(-1 * rec3 / 2);
				Char:ChangeMSp(-1 * rec4 / 2);
			end
		end
	end
end

function buff0054Attri(Char, buff, Attri) 
	Attri:SetAtk(Attri:GetAtk() * 1.15);
	Attri:SetDef(Attri:GetDef() * 0);
	Attri:SetPow(Attri:GetPow() * 1.15);	
end
