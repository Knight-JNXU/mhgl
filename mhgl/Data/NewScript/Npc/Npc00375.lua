
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00375 = {							-- 杵官王
	npc_id = 375,						-- NPC ID
	name = GetNpcName(375),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00375:Talk(bProcess) 
  NpcAsk({"在这个鸟语花香的世界上，万事万物都是那么神奇，少侠你能不能帮我抓一个生物来，我想做成标本好好研究一下。",
         "我愿支持大唐的科研事业",
         "做标本？这么残忍的事情我没兴趣帮忙", })
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00375)
