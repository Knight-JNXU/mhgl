 
--����ϼ
function buff20054Active(buff, Char, Other, Type) 

end

function buff20054Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
