 
--Ë¾Í½¸Õ
function buff20200Add(buff, Char) 

end

function buff20200Attri(Char, buff, Attri)

	
	local HP = Attri:GetMaxHp()-200
	if HP > 100 then
		Attri:SetMaxHp(HP)
	elseif HP <= 100 then
		Attri:SetMaxHp(100)
	end
end

function buff20200Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
