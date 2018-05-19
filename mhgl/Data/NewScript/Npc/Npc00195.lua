Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00195 = {							-- 孙小红
	npc_id = 195,						-- NPC ID
	name = GetNpcName(195),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00195:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
  NpcAsk("站住！俺黑山老妖几天没吃人了，嘴巴里简直要淡出个鸟来，今天竟然有送上门来的肥羊......哼哼，废话少说，你就认命了吧。")
  SetAnswer(1,"你带来了大蝙蝠了么？")
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
		SetAnswer(2, "任务链")
	end
  SetAnswer(3,"还没有呢，别急。")
  WaitAnswer(3)
	if GetAnswer() == 2 then
		if HasQuest(26001) then
			Quest26001:Return()
		elseif HasQuest(26002) then
			Quest26002:Return()
		elseif HasQuest(26003) then
			Quest26003:Return()
		elseif HasQuest(26004) then
			Quest26004:Return()
		end
	end
end

          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00195)
