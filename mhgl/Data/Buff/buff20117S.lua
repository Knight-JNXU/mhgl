 
--�Զ�����ϳ����ؾ���buff
function buff20117Add(buff, Char) 

end

function buff20117Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
