
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00058 = {							-- 孙小红
	npc_id = 58,						-- NPC ID
	name = GetNpcName(58),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00058:Talk(bProcess)
  NpcAsk("年轻人,你来的正好~最近傲来国大摆宴席,厨房里的生蚝肉已经快用光了,而我要出海去捕其他食材,你能不能挖点生蚝来！")
  SetAnswer(1,"我这有最近下海捞到的珍珠,便宜卖你")
  SetAnswer(2,"帮忙找生蚝肉")
  SetAnswer(6,"呃..蚝看了就头晕")
  WaitAnswer(6)
 end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00058)
