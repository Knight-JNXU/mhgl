
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00364 = {							-- 杵官王
	npc_id = 364,						-- NPC ID
	name = GetNpcName(364),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00364:Talk(bProcess) 
  NpcAsk({"交易点卡这，进步左拐直走。",
         "府衙禁地，闲杂人等不得入内。",
         "这里是天子脚下，太平的很。",
         "我们老爷是大唐的开国功臣！ ",
         "我们家老爷是凌烟阁二十四功臣之一。"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00364)
