 
--À¥ÖÝÁùÑý
function buff20067Add(buff, Char) 

end

function buff20067Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
