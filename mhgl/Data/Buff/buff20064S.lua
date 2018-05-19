 
--�̩
function buff20064Add(buff, Char) 

end

function buff20064Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
