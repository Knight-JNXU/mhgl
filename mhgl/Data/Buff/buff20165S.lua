 
--自动从蹴鞠场弹回京城buff
function buff20165Add(buff, Char) 

end

function buff20165Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
