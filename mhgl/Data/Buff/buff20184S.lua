 
--·ÉÌìÖ©Öë
function buff20184Add(buff, Char) 

end

function buff20184Attri(Char, buff, Attri)
	local Spd = Attri:GetSpd()-30
	if Spd > 5 then
		Attri:SetSpd(Spd)
	elseif Spd <= 5 then
		Attri:SetSpd(5)
	end
	
	
end


function buff20184Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
