 
--»¨Æ½
function buff20068Add(buff, Char) 

end

function buff20068Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
