 
--”Ò¡·ÁÁ
function buff20063Add(buff, Char) 

end

function buff20063Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
