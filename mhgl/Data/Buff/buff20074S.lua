 
--²·Õ½
function buff20074Add(buff, Char) 

end

function buff20074Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
