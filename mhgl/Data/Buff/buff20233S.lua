 
--�Զ�����ϳ����ؾ���buff
function buff20233Add(buff, Char) 

end

function buff20233Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
