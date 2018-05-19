 
--ÌúË®
function buff20076Add(buff, Char) 

end

function buff20076Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
