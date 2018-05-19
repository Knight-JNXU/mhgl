--真·闪灵心法

function skill0349Attri(Char, skillLv, Attri) 
	if Char:HasSkill(341) then
		Attri:SetEva(Attri:GetEva() + 50);
	else
		Attri:SetEva(Attri:GetEva() + 150);
	end
end

