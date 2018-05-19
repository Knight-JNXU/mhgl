 
--ÔÀ÷ë
function buff20091Add(buff, Char) 

end

function buff20091Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
