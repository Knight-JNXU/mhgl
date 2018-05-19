 
--≈∑—Ù–÷µ‹
function buff20229Add(buff, Char) 

end

function buff20229Add(buff, Char) 
	Char:SetSpeed(168)
end

function buff20229Attri(Char, buff, Attri)
	Attri:SetMaxHp(Attri:GetMaxHp()+400)
end

function buff20229Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
