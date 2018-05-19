Preload("Quest23001.lua")


Npc00339= {	
	npc_id = 339,				
	name = GetNpcName(339),	
	quests = {}	
}

function Npc00339:Talk(bProcess)
	local quest23001 = player:GetQuests():GetQuest(23001)
	NpcAsk("\#A你好！欢迎光临护卫集团！我是人见人爱，车见了我都爆胎的护卫总管，我这里可以雇佣一小时的罗刹护卫帮你战斗，让你告别双手，少侠要来一发吗？")
--	if  quest23001 and npc:GetMap():GetMap_id() == 100 then
	--SetAnswer(1, "VIP3豪华卷换书铁包")
    --SetAnswer(6, "至尊VIP2豪华卷换书铁包")
	--SetAnswer(2,"我要雇佣罗刹护卫")
	SetAnswer(3,"加速buff")
	--SetAnswer(4,"我要解雇罗刹护卫")
	SetAnswer(5,"离开")
	WaitAnswer(5)
	if GetAnswer() == 1 then
		 if player:GetItems():GetItemCount(51402) < 1 and  player:GetItems():GetItemCount(401680) < 1  and  player:GetItems():GetItemCount(61045) < 1 then
		 NpcSay("你不是VIP")
		 return
		 end
		if player:GetItems():GetItemCount(444444) < 3 then
		NpcSay("豪华卷不足")
		return
		else
		player:GetItems():RemoveItem(444444, 3)
         player:GetItems():AddItem(600002, 1)
		 ShowHint("小包包给你了哦给你了#46")
		 end
	elseif GetAnswer() == 2 then
		if player:HasBuff(273) or player:HasBuff(274) then
			NpcSay("我们帮不上你什么忙了。")
			return
		end
		if player:HasBuff(264) or player:HasBuff(265) or player:HasBuff(266) or player:HasBuff(267) or player:HasBuff(268) or player:HasBuff(269) or player:HasBuff(270) or player:HasBuff(271) or player:HasBuff(272) or player:HasBuff(273) or player:HasBuff(274) then
			NpcAsk("你已经雇佣了护卫，你确定继续吗？")
			SetAnswer(1,"继续")
			SetAnswer(2,"离开")
			WaitAnswer(2)
			
			if GetAnswer() == 1 then
				NpcSay("雇佣成功！接下来的一个小时普通暗雷战斗中护卫将会参加战斗。")
				if bProcess then
					player:RemoveBuff(264)
					player:RemoveBuff(265)
					player:RemoveBuff(266)
					player:RemoveBuff(267)
					player:RemoveBuff(268)
					player:RemoveBuff(269)
					player:RemoveBuff(270)
					player:RemoveBuff(271)
					player:RemoveBuff(272)
					player:AddBuff(272, 0, 0, 0, 60, 0)
				end
			end
		else
			NpcSay("雇佣成功！接下来的一个小时普通暗雷战斗中护卫将会参加战斗。")
			if bProcess then
				player:AddBuff(272, 0, 0, 0, 60, 0)
			end
		end
	elseif GetAnswer() == 3 then
		player:AddBuff(253, 0, 0, 0, 3600, 0)
	elseif GetAnswer() == 4 then
		if player:HasBuff(264) or player:HasBuff(265) or player:HasBuff(266) or player:HasBuff(267) or player:HasBuff(268) or player:HasBuff(269) or player:HasBuff(270) or player:HasBuff(271) or player:HasBuff(272) or player:HasBuff(273) or player:HasBuff(274) then
			NpcAsk("解除之后野外战斗对手人数将恢复正常，你确定吗？")
			SetAnswer(1,"解雇护卫")
			SetAnswer(2,"离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then
				NpcSay("你成功解雇了护卫。")
				if bProcess then
					player:RemoveBuff(264)
					player:RemoveBuff(265)
					player:RemoveBuff(266)
					player:RemoveBuff(267)
					player:RemoveBuff(268)
					player:RemoveBuff(269)
					player:RemoveBuff(270)
					player:RemoveBuff(271)
					player:RemoveBuff(272)
					player:RemoveBuff(273)
					player:RemoveBuff(274)
				end
			end
		else
			NpcSay("你没有雇佣护卫啊！。")
		end
		elseif GetAnswer() == 6 then
		 if player:GetItems():GetItemCount(51403) < 1 then
		 NpcSay("你不是至尊VIP")
		 return
		 end
		if player:GetItems():GetItemCount(444444) < 2 then
		NpcSay("豪华卷不足")
		return
		else
		player:GetItems():RemoveItem(444444, 2)
         player:GetItems():AddItem(600002, 1)
		 ShowHint("小包包给你了哦给你了#46")
		 end
	end
	end

AddNpcTable(Npc00339)