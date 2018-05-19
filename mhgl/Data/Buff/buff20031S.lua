
--ÏôÊ®Ò»ÀÉ
function buff20031Active(buff, Char, Other, Type) 

end

function buff20031Add(buff, Char) 
	Char:SetSpeed(195)
end

function buff20031Attri(Char, buff, Attri)

	
	Attri:SetAtk(Attri:GetAtk()+216) --¹¥»÷
	Attri:SetHit(Attri:GetHit()+87) --ÃüÖÐ
	
end


function buff20031Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
