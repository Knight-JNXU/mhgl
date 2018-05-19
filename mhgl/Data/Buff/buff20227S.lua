 
--ÌúÕ½
function buff20227Add(buff, Char) 

end

function buff20227Add(buff, Char) 
	Char:SetSpeed(170)
end


function buff20227Attri(Char, buff, Attri)
	Attri:SetAtk(Attri:GetAtk()+80)
end


function buff20227Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
