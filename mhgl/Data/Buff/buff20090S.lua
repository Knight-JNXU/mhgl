 
--Ê©¾­Ä«
function buff20090Add(buff, Char) 

end

function buff20090Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
