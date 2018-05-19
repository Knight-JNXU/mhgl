 
--ра©ч
function buff20084Add(buff, Char) 

end

function buff20084Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
