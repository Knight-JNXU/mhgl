 
--����Ӣ
function buff20024Active(buff, Char, Other, Type) 

end

function buff20024Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
