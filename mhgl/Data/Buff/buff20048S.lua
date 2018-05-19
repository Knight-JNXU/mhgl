 
--¿Ó—∞ª∂
function buff20048Active(buff, Char, Other, Type) 

end

function buff20048Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
