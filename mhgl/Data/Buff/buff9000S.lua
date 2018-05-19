--增加攻击,HP,防御BUFF

function buff9000Attri(Char, buff, Attri)
	Attri:SetAtk(Attri:GetAtk() * buff:GetBuffValue1() / 100);
	Attri:SetMaxHp(Attri:GetMaxHp() * buff:GetBuffValue2() / 100);
	Attri:SetDef(Attri:GetDef() * buff:GetBuffValue3() / 100);
end
