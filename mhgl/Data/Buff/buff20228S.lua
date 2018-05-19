 
--°×¿ªÐÄ
function buff20228Add(buff, Char) 

end

function buff20228Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20228Attri(Char, buff, Attri)
	local Def = Attri:GetDef()-50
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
	
	Attri:SetAtk(Attri:GetAtk()+120)
end

function buff20228Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
