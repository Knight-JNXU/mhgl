
--Ò¶¹Â³Ç
function buff20013Active(buff, Char, Other, Type) 

end

function buff20013Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
