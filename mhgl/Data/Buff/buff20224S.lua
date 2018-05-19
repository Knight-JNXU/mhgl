 
--Òõ¾ÅÓÄ
function buff20224Add(buff, Char) 

end

function buff20224Add(buff, Char) 
	Char:SetSpeed(190)
end

function buff20224Attri(Char, buff, Attri)
	local Def = Attri:GetDef()-70
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
	Attri:SetAtk(Attri:GetAtk()+120)
	Attri:SetSpd(Attri:GetSpd()+54)
end

function buff20224Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
