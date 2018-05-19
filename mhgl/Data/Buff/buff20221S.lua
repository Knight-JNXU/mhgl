 
--¹þ¹þ¶ù
function buff20221Add(buff, Char) 

end

function buff20221Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20221Attri(Char, buff, Attri)

	Attri:SetMaxSp(Attri:GetMaxSp()+60)
	
end

function buff20221Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
