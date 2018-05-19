--自身内功减益(酒)

function buff1420Attri(Char, buff, Attri)
	Attri:SetPow(Attri:GetPow() - buff:GetBuffValue2());
end
