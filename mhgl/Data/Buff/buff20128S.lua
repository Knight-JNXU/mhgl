 
--¹«Ëï´óÄï
function buff20128Add(buff, Char) 

end

function buff20128Attri(Char, buff, Attri)

	
	local HP = Attri:GetMaxHp()-180
	if HP > 100 then
		Attri:SetMaxHp(HP)
	elseif HP <= 100 then
		Attri:SetMaxHp(100)
	end
end


function buff20128Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
