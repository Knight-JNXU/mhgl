 
--°¢·É
function buff20045Active(buff, Char, Other, Type) 

end

function buff20045Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
