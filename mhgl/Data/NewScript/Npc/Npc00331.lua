

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00331 = {							-- 杵官王
	npc_id = 331,						-- NPC ID
	name = GetNpcName(331),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00331:Talk(bProcess) 
  NpcAsk("少侠想做什么呢？")
  SetAnswer(1,"我要帮助你除暴安良")
  SetAnswer(2,"我要取消任务 ")
  SetAnswer(3,"领取支线任务")
  SetAnswer(4,"我只是路过?")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00331)
