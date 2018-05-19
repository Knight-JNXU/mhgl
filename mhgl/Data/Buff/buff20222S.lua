 
--Àî´ó×ì
function buff20222Add(buff, Char) 

end

function buff20222Add(buff, Char) 
	Char:SetSpeed(170)
end

function buff20222Attri(Char, buff, Attri)
	local HP = Attri:GetMaxHp()-300
	if HP > 100 then
		Attri:SetMaxHp(HP)
	elseif HP <= 100 then
		Attri:SetMaxHp(100)
	end
	
	Attri:SetSpd(Attri:GetSpd()+50)
end

function buff20222Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
