--beifang
--饭跑跑
Preload("Quest80001.lua")
Preload("Quest80002.lua")
Preload("Quest80003.lua")
Preload("Quest80004.lua")

Npc000725 = {							-- 饭跑跑
	npc_id = 725,						-- NPC ID
	name = GetNpcName(725),				-- NPC 名称
	quests = { Quest80001,Quest80002,Quest80003,Quest80004 }				-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc000725:Talk(bProcess)
	NpcAsk("想在江湖混的好，先跟我学怎么跑！")	
	SetAnswer(1, "跑商任务")
	SetAnswer(2, "取消跑商任务")	
	SetAnswer(3, "关于跑商任务")
	if player:GetGuild() ~= nil then
		SetAnswer(4, "查看跑商记录")
	end
	if player:GetGuild() ~= nil and player:GetGuildPos() ~= 1 and player:GetGuildPos() ~= 2 and player:GetGuildPos() ~= 9 then
		SetAnswer(5, "申请成为商人")
	end	
	if player:GetGuild() ~= nil and player:GetGuildPos() == 1 then
		if player:GetGuild():GetAutoManageBusiness( ) then
			SetAnswer(6, "关闭自动管理商人")
		else
			SetAnswer(7, "开启自动管理商人")	
		end
	end
	SetAnswer(10, "离开")
	WaitAnswer(10)
	if GetAnswer() == 1 then
	--[[local A = math.random(1,10)
	  if A <= 5 then
		  if not bProcess then
				player:AntiHack()
			end
	  end--]]
		if player:GetQuests():HasQuest(80001) then
			Quest80001:Return()
			return
		end		
		if player:GetQuests():HasQuest(80002) then
			Quest80002:Return()
			return
		end
		if player:GetQuests():HasQuest(80003) then
			Quest80003:Return()
			return
		end			
		if player:GetQuests():HasQuest(80004) then
			Quest80004:Return()
			return
		end	 				
		if player:GetLevel() < 30 then
			NpcSay(string.format("\#P30\#W级以下的玩家不能领取跑商任务。"))
			return
		end
		if player:GetQuests():GetType(800) and player:GetQuests():GetType(800):GetLimitRound() == 8 then
			player:GetQuests():RemoveType(800)
		end
		NpcAsk("每周可以进行48次普通跑商和8次高效跑商，你现在选择哪种呢？")	
		SetAnswer(1, "普通跑商")
		SetAnswer(2, "高效跑商")
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			player:GetQuests():SetFlag(800,2)
		elseif GetAnswer() == 2 then
			player:GetQuests():SetFlag(800,1)
		else
			return
		end
		if player:GetLevel() < 50 then
			Quest80001:Take()
		elseif player:GetLevel() < 70 then
			Quest80002:Take()
		elseif player:GetLevel() < 90 then
			Quest80003:Take()
		elseif player:GetLevel() < 180 then
			Quest80004:Take()
		end	
	elseif GetAnswer() == 2 then
		if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
			NpcAsk("取消跑商任务将扣除你的10点帮贡，且在一个小时内无法再领取任务，你确认要取消跑商任务？")	
			SetAnswer(1, "是")
			SetAnswer(2, "否")
			WaitAnswer(2)		
			if GetAnswer() == 1 then
				if IsProcess() then	
					script:SetSaying(true)		
					player:ChangeGDonate(-10)				
					player:GetQuests():RemoveQuest(80001)
					player:GetQuests():RemoveQuest(80002)
					player:GetQuests():RemoveQuest(80003)
					player:GetQuests():RemoveQuest(80004)
					player:RemoveBuff(277)
					player:GetItems():RemoveAllBusinessItem()
					player:GetQuests():SetTimeMark(800)
					NpcSay("跑商任务已取消。")			
				end
			end
		else
		    NpcSay("你的身上没有跑商任务。")
		end	
	elseif GetAnswer() == 3 then
	    NpcSay("帮派中只有帮主、副帮主和商人才可以领取跑商任务，商人在领取跑商任务的同时，会获得一张帮派商票，通过和各地的商人进行贸易往来让帮派商票增加，帮派商票达到一定的金额时就可以交任务，不同等级的商人可以领取的帮派商票等级也不同。")
	elseif GetAnswer() == 4 and bProcess then		
		if IsProcess() then	
			player:OpenBusinessLog()	
		end
	elseif GetAnswer() == 5 then
		if player:GetGuild():GetAutoManageBusiness( ) then
			if player:GetGDonate() >= 0 then
				if IsProcess() then	
					player:ApplyTrader()
				end
			else
			    NpcSay("当前帮贡大于20点的帮众才能申请成商人。")
			end			
		else
			NpcSay("本帮没有开启自动管理商人功能。")
		end				
	elseif GetAnswer() == 6 then
		player:GetGuild():ChangeAutoManageBusiness(false)
		NpcSay("成功关闭自动管理商人功能。")		
	elseif GetAnswer() == 7 then
		player:GetGuild():ChangeAutoManageBusiness(true)
		NpcSay("成功开启自动管理商人功能。")
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc000725)
