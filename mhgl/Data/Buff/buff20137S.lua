 
--�Զ�����ϳ����ؾ���buff
function buff20137Add(buff, Char) 

end

function buff20137Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
