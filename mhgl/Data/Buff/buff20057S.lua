 
--∂ÒπÌ¿Æ∞»
function buff20057Active(buff, Char, Other, Type) 

end

function buff20057Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
