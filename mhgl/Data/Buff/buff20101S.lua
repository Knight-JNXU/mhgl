 
--�Զ�����ϳ����ؾ���buff
function buff20101Add(buff, Char) 

end

function buff20101Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
