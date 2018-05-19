
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00246 = {							-- 杵官王
	npc_id = 246,						-- NPC ID
	name = GetNpcName(246),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00246:Talk(bProcess) 
  NpcAsk({"千年如一梦......醒来的时候，什么都改变了。",
       "这大雁塔里的阴森之气很重，正适合在这里修炼。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00246)
