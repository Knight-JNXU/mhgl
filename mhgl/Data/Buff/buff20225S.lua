 
--Οτίδίδ
function buff20225Add(buff, Char) 

end

function buff20225Attri(Char, buff, Attri)
	
	Attri:SetPow(Attri:GetPow()+80)

end

function buff20225Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
