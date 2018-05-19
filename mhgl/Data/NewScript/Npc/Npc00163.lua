
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00163 = {							-- 孙小红
	npc_id = 163,						-- NPC ID
	name = GetNpcName(163),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00163:Talk(bProcess)
  NpcAsk("人参果乃我五庄观特有之仙物，需历时万年才一熟！家师命我在此严加看管人生果树，并向各位有缘人出售成熟人参果。")
  SetAnswer(1,"我要花费门派贡献与体力购买人参果。")
  SetAnswer(2,"购买未点化的人参果。")
  SetAnswer(3,"我想了解关于人参果的事情。")
  SetAnswer(3,"我只是来看看热闹。")
  WaitAnswer(3)
end


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00163)
