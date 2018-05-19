 
--ÍæÅ¼ÍÞÍÞ
function buff20201Add(buff, Char) 

end

function buff20201Attri(Char, buff, Attri)
	local Def = Attri:GetDef()-40
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
end

function buff20201Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
