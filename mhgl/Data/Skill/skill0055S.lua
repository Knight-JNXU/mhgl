--长河落日

function skill0055Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 4.6 + 30;
	local increaseValue = 32 + skillLv * 3.2 + 0.007 * skillLv^2;
	Attri:SetAtk(Attri:GetAtk() + increaseValue);
end
