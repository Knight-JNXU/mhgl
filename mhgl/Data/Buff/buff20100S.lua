 
--�Զ�����ϳ����ؾ���buff
function buff20100Add(buff, Char) 

end

function buff20100Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
