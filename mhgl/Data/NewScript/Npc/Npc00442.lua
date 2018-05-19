Preload("Quest10013.lua")
Preload("Quest10014.lua")
Preload("Quest10015.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Npc00442 = {							
	npc_id = 442,					
	name = GetNpcName(442),	
	quests = { Quest10013,Quest10014 }	
}

function Npc00442:Talk(bProcess)
	local quest30605 = player:GetQuests():GetQuest(30605) 
	local quest30606 = player:GetQuests():GetQuest(30606)
	local quest30607 = player:GetQuests():GetQuest(30607)
	local quest30608 = player:GetQuests():GetQuest(30608)
	local BankFlag = player:GetQuests():GetFlag(10)
	local BankMoneyMax = 10000000*(BankFlag+1)
	local quest_ids = {10013,10014}
	NpcAsk(string.format("你可以在我这里随时随地存取银两(你的钱庄上限为\#G%d\#W)，此外如果你获得一些由官方额外派发的虚拟道具可以在我这里的乾坤袋中领取哟~", BankMoneyMax))
	if HasQuest(quest_ids) then
		SetAnswer(1, "主线任务")
	end
	SetAnswer(2, "存钱")
	SetAnswer(3, "取钱")
	SetAnswer(4, "乾坤袋")
	if (HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id) then
		SetAnswer(5, "镖局任务")
	end
	SetAnswer(6, "离开")
	WaitAnswer(6)
	local answer = GetAnswer()
	if answer == 1 then
		if HasQuest(10013) then
				if Quest10013:Return() then
					Quest10014:Take()
				end
		elseif HasQuest(10014) then
			Quest10014:Return()
		end
	elseif answer == 2 then
		if bProcess then
			script:OpenInterface("bankdeposit",1);
		end	
	elseif answer == 3 then
		if bProcess then
			script:OpenInterface("bankwithdraw", 1);
		end
	elseif answer == 4 then	
		if bProcess then
			player:OpenGiftBox()
		--[[	player:OpenBusinessGuildListUi()--商会某接口
			player:OpenCreateBusinessGuildUi()--注册商会接口
			player:OpenManageBusinessGuildUi()--没有接口
	    player:OpenSellGuildListUi()--准备转让的商店--]]

			
			
		end
	elseif GetAnswer() == 5 then	
			if HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id then
				Quest30605:ReturnFirst()
			elseif HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id then
				Quest30606:ReturnFirst()
			elseif HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id then
				Quest30607:ReturnFirst()
			elseif HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id then	
				Quest30608:ReturnFirst()
			end
	end
end

AddNpcTable(Npc00442)

