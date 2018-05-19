 
--н╨встф
function buff20075Add(buff, Char) 

end

function buff20075Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
