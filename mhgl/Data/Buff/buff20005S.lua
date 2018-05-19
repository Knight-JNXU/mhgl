Preload("Inst00012.lua")
--自动从蹴鞠场弹回京城buff
function buff20005Add(buff, Char) 

end

function buff20005Remove(buff, Char)
	local OwnerID = Char:GetMap():GetOwner_id()
	local Num = Char:GetQuests():GetNpcFlag(300482,0,OwnerID)
	Char:GetQuests():SetNpcFlag(300482,0,OwnerID,Num-1)
	if Num == 1 then--蹴鞠场人数为0，将该蹴鞠场设定为开始状态
		Char:GetQuests():SetNpcFlag(300482,OwnerID,3,0)
	end
	Char:LeaveInstance(12, OwnerID, 20300, 163, 84, 1)
end
