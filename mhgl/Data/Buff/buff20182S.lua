 
--ÐÜÌì½¡
function buff20182Add(buff, Char) 

end

function buff20182Attri(Char, buff, Attri)

	
	local HP = Attri:GetMaxHp()-120
	if HP > 100 then
		Attri:SetMaxHp(HP)
	elseif HP <= 100 then
		Attri:SetMaxHp(100)
	end
end


function buff20182Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
