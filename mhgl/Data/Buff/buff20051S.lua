 
--��С��
function buff20051Active(buff, Char, Other, Type) 

end

function buff20051Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end