 
--¬…œ„¥®
function buff20040Active(buff, Char, Other, Type) 

end

function buff20040Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
