 
--�Զ�����ϳ����ؾ���buff
function buff20102Add(buff, Char) 

end

function buff20102Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
