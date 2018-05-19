--嫁衣神功效果

function buff1517Attri(Char, buff, Attri)
	if Char:IsMob() then
		if Char:GetMob_id() == 30712 then
			Attri:SetAtk(Attri:GetAtk() * 1.2);
			Attri:SetDef(Attri:GetDef() * 1.3);
			Attri:SetPow(Attri:GetPow() * 1.3);			
		else
			Attri:SetAtk(Attri:GetAtk() * 1.3);
			Attri:SetDef(Attri:GetDef() * 2);
			Attri:SetPow(Attri:GetPow() * 2);
			Attri:SetMaxHp(Attri:GetMaxHp() * 1.5);
		end
	end
end 