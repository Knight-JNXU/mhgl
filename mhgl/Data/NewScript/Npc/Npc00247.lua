
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00247 = {							-- 杵官王
	npc_id = 247,						-- NPC ID
	name = GetNpcName(247),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00247:Talk(bProcess) 
  NpcAsk({"大梦初醒，我们要继续祸害天下了，哈哈哈！",
       "血，我需要血，我已经有几百年没有进食了。",
       "四百年了，是什么把我从永恒的沉睡中唤醒。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00247)
