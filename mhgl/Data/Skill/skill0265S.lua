--防御修正(十三太保横练)

function skill0265Attri(Char, skillLv, Attri) 

	Attri:SetDef(Attri:GetDef() + Char:GetLevel() * 0.6);

end
