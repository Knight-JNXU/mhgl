 
--ÈËÉÏÈË
function buff20083Add(buff, Char) 

end

function buff20083Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20083Attri(Char, buff, Attri)

	Attri:SetAtk(Attri:GetAtk()+180)
	
	local Def = Attri:GetDef()-60
	if Def > 5 then
		Attri:SetDef(Def)
	elseif Def <= 5 then
		Attri:SetDef(5)
	end
end

function buff20083Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
