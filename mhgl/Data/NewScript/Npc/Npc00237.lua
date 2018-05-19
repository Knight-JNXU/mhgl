
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00237 = {							-- 杵官王
	npc_id = 237,						-- NPC ID
	name = GetNpcName(237),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00237:Talk(bProcess) 
  NpcAsk({"不可说，不可说。",
       "苦海无边，回头是岸。",
       "得即是失，失即是得，世事本事过眼云烟，不必太过看重。",
       "无色无相，无嗔无狂。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00237)
