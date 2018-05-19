
--Î÷ÃÅ´µÑ©
function buff20011Active(buff, Char, Other, Type) 

end

function buff20011Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
