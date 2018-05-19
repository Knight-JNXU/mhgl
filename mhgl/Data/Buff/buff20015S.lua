
--Ë¾¿ÕÕªÐÇ
function buff20015Active(buff, Char, Other, Type) 

end

function buff20015Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
