 
--�Զ�����ϳ����ؾ���buff
function buff20104Add(buff, Char) 

end

function buff20104Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
