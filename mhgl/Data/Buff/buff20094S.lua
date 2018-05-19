 
--ม๚ะกิฦ
function buff20094Add(buff, Char) 

end

function buff20094Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
