 
--°×ÔÆÄÁÅ®
function buff20087Add(buff, Char) 

end

function buff20087Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
