Preload("Inst00012.lua")
--�Զ�����ϳ����ؾ���buff
function buff20005Add(buff, Char) 

end

function buff20005Remove(buff, Char)
	local OwnerID = Char:GetMap():GetOwner_id()
	local Num = Char:GetQuests():GetNpcFlag(300482,0,OwnerID)
	Char:GetQuests():SetNpcFlag(300482,0,OwnerID,Num-1)
	if Num == 1 then--��ϳ�����Ϊ0��������ϳ��趨Ϊ��ʼ״̬
		Char:GetQuests():SetNpcFlag(300482,OwnerID,3,0)
	end
	Char:LeaveInstance(12, OwnerID, 20300, 163, 84, 1)
end
