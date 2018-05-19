 
--¶ÎÓñ
function buff20022Active(buff, Char, Other, Type) 

end

function buff20022Attri(Char, buff, Attri)

	local Atk = Attri:GetAtk()-40
	if Atk > 5 then
		Attri:SetAtk(Atk)
	elseif Atk <= 5 then
		Attri:SetAtk(5)
	end
	--¹¥»÷
	
	
end

function buff20022Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
