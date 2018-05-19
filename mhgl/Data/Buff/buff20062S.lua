 
--Πε»¨΄σµΑ
function buff20062Add(buff, Char) 

end

function buff20062Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
