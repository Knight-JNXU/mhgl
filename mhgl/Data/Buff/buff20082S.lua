 
--Ìì¸ÙµÀ³¤
function buff20082Add(buff, Char) 

end




function buff20082Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
