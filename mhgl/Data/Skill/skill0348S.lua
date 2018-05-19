--真·射影心法

function skill0348Attri(Char, skillLv, Attri) 
	if Char:HasSkill(340) then
		Attri:SetHit(Attri:GetHit() + 50);
	else
		Attri:SetHit(Attri:GetHit() + 150);
	end
end

