

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00289 = {							-- 杵官王
	npc_id = 289,						-- NPC ID
	name = GetNpcName(289),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00289:Talk(bProcess) 
  NpcAsk("长安城繁华盛世，住在这里出入方便，来去自由啊！")
  SetAnswer(1,"送我回社区")
  SetAnswer(2,"送我回家 ")
  SetAnswer(3,"家门口   ")
  SetAnswer(4,"我的土地 ")
  SetAnswer(5,"宅邸评选 ")
  SetAnswer(6,"我要进入朋友家牧场 ")
  SetAnswer(7,"路过 ")
  WaitAnswer(7)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00289)
