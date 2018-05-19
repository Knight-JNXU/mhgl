 
--ÎÂÁ¼Óñ
function buff20060Active(buff, Char, Other, Type) 

end

function buff20060Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
