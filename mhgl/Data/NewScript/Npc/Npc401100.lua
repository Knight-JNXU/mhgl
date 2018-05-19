--耳朵
Preload("Quest50000.lua")
Npc401100 = {							-- 葛成
	npc_id = 401100,						-- NPC ID
	name = GetNpcName(401100),				-- NPC 名称
	quests = { Quest50000 },  	-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc401100:Talk(bProcess)
	-- NPC 问选择问题，随机从文字表中选一个
	NpcAsk("有谁看不惯的尽管来，遇神杀神，遇佛杀佛。" )	
    SetAnswer(1, "这里还轮不到你说话")
    SetAnswer(2, "离开")
    WaitAnswer(2)	
	
	if GetAnswer() == 1 then 
	    if party then
		    for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
				if member then
	                if member:GetQuests():TimeMarkOver(50000, 180) == false and not member:GetQuests():HasQuest(50000)  then
						NpcSayParty(string.format("\#P%s\#W已经完成或者退出本次活动。", member:GetName()))
						return
					end
					if member:GetQuests():HasQuest(50000) and member:GetQuests():GetQuest(50000):IsFailed() then
						NpcSayParty(string.format("\#P%s\#W任务清空以后再来吧。", member:GetName()))
						return
					end	
				end
			end
			local q = party:GetInPartyMember(0):GetQuests():GetQuest(50000)
			if q == nil then
				Quest50000:Take()
			elseif party:GetInPartyMember(0):GetQuests():GetQuest(50000):IsFailed() == false then
				NpcSayParty("打赢了你还想怎样？")
			end
		else
			NpcSayParty("打架人多才有意思，你一个人我还懒得出手。")
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc401100)
