--修仙术

function skill21020Attri(Char, skillLv, Attri) 
	local increaseValue1 = skillLv * 1.5 + 0.005 * skillLv ^ 2;
	local increaseValue2 = skillLv * 2.4 + 0.008 * skillLv ^ 2 + 20;
	local increaseValue3 = skillLv * 2.1 + 0.007 * skillLv ^ 2;
	local increaseValue4 = skillLv * 2.4 + 0.008 * skillLv ^ 2;
	local increaseValue8 = skillLv * 2.1 + 0.007 * skillLv ^ 2;
	--[[Attri:SetEva(Attri:GetEva() + increaseValue1 / 5);
	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 5);
	Attri:SetPow(Attri:GetPow() + increaseValue3 / 5);
	Attri:SetDef(Attri:GetDef() + increaseValue4 / 5);
	Attri:SetMaxSp(Attri:GetMaxSp() + increaseValue8 / 5);--]]
end
