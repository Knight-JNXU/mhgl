
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00365 = {							-- 杵官王
	npc_id = 365,						-- NPC ID
	name = GetNpcName(365),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00365:Talk(bProcess) 
  NpcAsk("古之善赏这，费少而劝众：善罚者，刑省而奸禁：善予者，用约而为德：善取者，入多而无怨。!")
  SetAnswer(1,"什么是三界功绩？")
  SetAnswer(2,"我想看看我有多少三界功绩 ")
  SetAnswer(3,"我来查询并兑换免费仙玉 ")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00365)
