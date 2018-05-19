
--ºúÌú»¨
function buff20014Active(buff, Char, Other, Type) 

end

function buff20014Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
