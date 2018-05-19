--麒麟发怒2效果

function buff1528Attri(Char, buff, Attri)
	if Char:IsMob() then
		Attri:SetAtk(Attri:GetAtk() * 1.6)
		Attri:SetDef(Attri:GetDef() * 1.6)
		Attri:SetPow(Attri:GetPow() * 1.6)
	end
end 