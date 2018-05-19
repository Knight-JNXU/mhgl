--真·紫电心法

function skill0351Attri(Char, skillLv, Attri) 
	if Char:HasSkill(343) then
		Attri:SetSpd(Attri:GetSpd() + 10);
	else
		Attri:SetSpd(Attri:GetSpd() + 30);
	end
end


