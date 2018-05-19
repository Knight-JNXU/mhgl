 
--∫ÿ…– È
function buff20070Add(buff, Char) 

end

function buff20070Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
