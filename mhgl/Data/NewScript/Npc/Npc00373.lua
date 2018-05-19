
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00373 = {							-- 杵官王
	npc_id = 373,						-- NPC ID
	name = GetNpcName(373),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00373:Talk(bProcess) 
  NpcAsk("你要去战神山吗？如果你收集到附有蚩尤神力的上古灵符，请去山巅交给供奉战神的巫师，恢复战神的力量。")
  SetAnswer(1,"上古灵符是什么？")
  SetAnswer(2,"送我去战神山。")
  SetAnswer(3,"只是随便看看。")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00373)
