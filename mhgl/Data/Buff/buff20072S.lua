 
--´¬·ò
function buff20072Add(buff, Char) 

end

function buff20072Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
