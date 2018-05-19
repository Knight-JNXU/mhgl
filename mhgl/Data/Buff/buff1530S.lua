--麒麟发怒4效果

function buff1530Attri(Char, buff, Attri)
	if Char:IsMob() then
		Attri:SetAtk(Attri:GetAtk() * 3)
		Attri:SetDef(Attri:GetDef() * 3)
		Attri:SetPow(Attri:GetPow() * 3)
	end
end 