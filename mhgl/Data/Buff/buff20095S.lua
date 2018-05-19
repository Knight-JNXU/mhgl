 
--Áø½ðÁ«
function buff20095Add(buff, Char) 

end

function buff20095Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
