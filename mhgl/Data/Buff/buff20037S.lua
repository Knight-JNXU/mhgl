 
--����
function buff20037Active(buff, Char, Other, Type) 

end

function buff20037Add(buff, Char) 
	Char:SetSpeed(190)
end

function buff20037Attri(Char, buff, Attri)

	
	Attri:SetAtk(Attri:GetAtk()+108) --����
	Attri:SetSpd(Attri:GetSpd()+54)   --�ٶ�  
	Attri:SetHit(Attri:GetHit()+87) --����
	
end

function buff20037Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
