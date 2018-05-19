
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00563 = {							-- 杵官王
	npc_id = 563,						-- NPC ID
	name = GetNpcName(563),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00563:Talk(bProcess) 
  NpcAsk({"长寿村远近闻名，人杰地灵。",
         "他口中的人间仙境，可是说的这里？",
         "北面上去就是方寸山，听说菩提祖师就住在哪里。",
         "逝者如斯夫，何日君再来？",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00563)
