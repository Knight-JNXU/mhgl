 
--√œ–«ªÍ
function buff20020Active(buff, Char, Other, Type) 

end

function buff20020Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
