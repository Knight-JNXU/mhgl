
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00355 = {							-- 杵官王
	npc_id = 355,						-- NPC ID
	name = GetNpcName(355),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00355:Talk(bProcess) 
  NpcAsk({"皇宫禁地，闲杂人等不得入内！",
         "当今圣上英明，国泰民安。",
         "若要在此喧闹，别怪我不客气！",
         "这里是天子脚下，太平的很。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00355)
