 
--�Զ�����ϳ����ؾ���buff
function buff20130Add(buff, Char) 

end

function buff20130Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
