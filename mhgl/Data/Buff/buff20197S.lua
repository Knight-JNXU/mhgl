 
--�Զ�����ϳ����ؾ���buff
function buff20197Add(buff, Char) 

end

function buff20197Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
