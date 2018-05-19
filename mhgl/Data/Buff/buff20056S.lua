 
--к╬бМворб
function buff20056Active(buff, Char, Other, Type) 

end

function buff20056Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
