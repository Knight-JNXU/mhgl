 
--Ô­ËæÔÆ
function buff20018Active(buff, Char, Other, Type) 

end

function buff20018Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
