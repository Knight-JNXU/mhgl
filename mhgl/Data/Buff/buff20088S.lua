 
--�����
function buff20088Add(buff, Char) 

end

function buff20088Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
