 
--¹«×ÓÓð
function buff20030Active(buff, Char, Other, Type) 

end

function buff20030Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
