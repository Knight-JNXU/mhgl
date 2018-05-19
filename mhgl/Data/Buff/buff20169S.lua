 
--Éñµ¶¹«×Ó
function buff20169Add(buff, Char) 

end

function buff20169Attri(Char, buff, Attri)
	local Def = Attri:GetDef()-60
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
	
end

function buff20169Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
