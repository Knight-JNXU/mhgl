
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00320 = {							-- 杵官王
	npc_id = 320,						-- NPC ID
	name = GetNpcName(320),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00320:Talk(bProcess) 
  NpcAsk({"平日里多逛逛街，常会遇到些物美价廉的东西。",
         "那边的威震天真是个大嗓门，得想办法管管他。",
         "好心借钱给别人，他们却说我放高利贷......",
         "“哎，现在是钱多的想花都花不出去，还一天到晚涨利息。这还不是叫人把钱砸手里吗？”",
         "没事我也染个发去，不就十几万银子嘛，我有的是钱。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00320)
