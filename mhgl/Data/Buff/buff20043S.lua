 
--ÑàÄÏÌì
function buff20043Active(buff, Char, Other, Type) 

end

function buff20043Add(buff, Char) 
	Char:SetSpeed(185)
end

function buff20043Attri(Char, buff, Attri)

	
	Attri:SetAtk(Attri:GetAtk()+150)
	Attri:SetSpd(Attri:GetSpd()+30)
	local Def = Attri:GetDef()-80
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
end

function buff20043Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
