 
--������
function buff20065Add(buff, Char) 

end

function buff20065Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
