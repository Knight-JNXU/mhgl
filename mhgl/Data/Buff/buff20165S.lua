 
--�Զ�����ϳ����ؾ���buff
function buff20165Add(buff, Char) 

end

function buff20165Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
