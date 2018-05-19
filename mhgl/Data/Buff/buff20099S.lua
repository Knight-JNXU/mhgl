 
--ÐÜÃ¨¶ù
function buff20099Add(buff, Char) 

end

function buff20099Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
