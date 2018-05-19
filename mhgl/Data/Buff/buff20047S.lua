 
--»¨ÂúÂ¥
function buff20047Active(buff, Char, Other, Type) 

end

function buff20047Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
