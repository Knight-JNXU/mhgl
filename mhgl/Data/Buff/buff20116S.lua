 
--�Զ�����ϳ����ؾ���buff
function buff20116Add(buff, Char) 

end

function buff20116Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
