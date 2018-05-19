
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00192 = {							-- 孙小红
	npc_id = 192,						-- NPC ID
	name = GetNpcName(192),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00192:Talk(bProcess)
  NpcAsk("你要进去看望朋友呀？我送你进去，不要惹事就好。")
  SetAnswer(1,"是的，送我进去。")
  SetAnswer(2,"不，我才不去呢。")
  WaitAnswer(2)
end


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00192)
