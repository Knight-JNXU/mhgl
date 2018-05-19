 
--¿…∏ÒÀπ
function buff20078Add(buff, Char) 

end

function buff20078Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
