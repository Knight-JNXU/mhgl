--麒麟发怒3效果

function buff1529Attri(Char, buff, Attri)
	if Char:IsMob() then
		Attri:SetAtk(Attri:GetAtk() * 2)
		Attri:SetDef(Attri:GetDef() * 2)
		Attri:SetPow(Attri:GetPow() * 2)
	end
end 