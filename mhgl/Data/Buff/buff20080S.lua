 
--÷Ï∞À
function buff20080Add(buff, Char) 

end


function buff20080Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
