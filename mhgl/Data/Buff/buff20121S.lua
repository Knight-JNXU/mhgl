 
--�Զ�����ϳ����ؾ���buff
function buff20121Add(buff, Char) 

end

function buff20121Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
