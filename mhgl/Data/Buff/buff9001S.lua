--MOB增加内功，速度，闪避BUFF

function buff9001Attri(Char, buff, Attri) 
	Attri:SetPow(Attri:GetPow() * buff:GetBuffValue1() / 100);
	Attri:SetSpd(Attri:GetSpd() * buff:GetBuffValue2() / 100);
	Attri:SetEva(Attri:GetEva() * buff:GetBuffValue3() / 100);
end
