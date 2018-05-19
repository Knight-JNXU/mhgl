 
--ÌúµÑÏÈÉú
function buff20176Add(buff, Char) 

end

function buff20176Attri(Char, buff, Attri)

	
	
end

function buff20176Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
