 
--�Զ�����ϳ����ؾ���buff
function buff20105Add(buff, Char) 

end

function buff20105Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
