--最大血上限增益(金针通脉)

function buff1516Attri(Char, buff, Attri) 
	Attri:SetMaxHp(Attri:GetMaxHp() * buff:GetBuffValue2());
end
