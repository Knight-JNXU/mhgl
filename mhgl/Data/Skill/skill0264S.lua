--攻击修正()

function skill0264Attri(Char, skillLv, Attri) 

	Attri:SetAtk(Attri:GetAtk() + Char:GetLevel() * 0.52);

end
