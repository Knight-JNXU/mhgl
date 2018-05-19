--登萍渡水

function skill0101Attri(Char, skillLv, Attri) 
	--local increaseValue = skillLv * 1 + skillLv ^ 2 / 225;
	local increaseValue = skillLv * 0.7 + skillLv ^ 2 / 225;
	Attri:SetSpd(Attri:GetSpd() + increaseValue);
end
