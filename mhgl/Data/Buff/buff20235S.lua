 
--�Զ�����ϳ����ؾ���buff
function buff20235Add(buff, Char) 

end

function buff20235Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
