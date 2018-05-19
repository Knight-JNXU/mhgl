 
--÷ÏÕ£
function buff20079Add(buff, Char) 

end

function buff20079Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
