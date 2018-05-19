--beifang
--狼山商人

Npc00569 = {							                               -- 狼山商人
	npc_id = 569,						                               -- NPC ID
	name = GetNpcName(569),				                               -- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00569:Talk(bProcess)	
	NpcAsk( "不管是历经沧桑的前辈，还是乳臭未干的后辈，都与我们有着频繁的贸易往来。")		
	SetAnswer(1, "买卖商品")
	SetAnswer(2, "离开")
	WaitAnswer(2)	
	if GetAnswer() == 1 then	
		if player:GetGuild() == nil then
			NpcSay("我们不和来历不明的人通商。")
			return false
		end		
		if player:GetGuildPos() == 1 or player:GetGuildPos() == 2 or player:GetGuildPos() == 7 or player:GetGuildPos() == 9 then				
			if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then	
			  player:OpenBusinessShop(7)
			else				
				NpcSay("你连帮派银票都没带在身上，这让我怎么和你进行贸易往来？")
			end		
		else
		    NpcSay("我只与商人交谈。")
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00569)
