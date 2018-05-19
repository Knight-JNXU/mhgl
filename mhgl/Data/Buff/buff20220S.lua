 
--¶ÅÉ±
function buff20220Add(buff, Char) 

end

function buff20220Add(buff, Char) 
	Char:SetSpeed(185)
end

function buff20220Attri(Char, buff, Attri)

	Attri:SetPow(Attri:GetPow()+140)
	local Spd = Attri:GetSpd()-40
	if Spd > 5 then
		Attri:SetSpd(Spd)
	elseif Spd <= 5 then
		Attri:SetSpd(5)
	end
	
end

function buff20220Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
