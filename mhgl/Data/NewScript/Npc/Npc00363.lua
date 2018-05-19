

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00363 = {							-- 杵官王
	npc_id = 363,						-- NPC ID
	name = GetNpcName(363),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00363:Talk(bProcess) 
  NpcAsk("我是云游到此的转服使者，你如果有此需要可以找我好好聊聊。")
  SetAnswer(1,"进行转服相关操作")
  SetAnswer(2,"转服烟花竞拍 ")
  SetAnswer(3,"我可没此需求，就此拜别！")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00363)
