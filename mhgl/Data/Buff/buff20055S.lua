 
--—‡∆ﬂ
function buff20055Active(buff, Char, Other, Type) 

end

function buff20055Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
