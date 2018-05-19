
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00050 = {							-- 孙小红
	npc_id = 50,						-- NPC ID
	name = GetNpcName(50),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00050:Talk(bProcess)
  NpcAsk("这里上去就是繁华的长安城了。")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00050)
