 
--中原一点红
function buff20033Active(buff, Char, Other, Type) 

end

function buff20033Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
