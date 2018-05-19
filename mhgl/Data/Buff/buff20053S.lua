 
--Ã·¶şÏÈÉú
function buff20053Active(buff, Char, Other, Type) 

end

function buff20053Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
