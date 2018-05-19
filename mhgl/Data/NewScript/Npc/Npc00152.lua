
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00152 = {							-- 孙小红
	npc_id = 152,						-- NPC ID
	name = GetNpcName(152),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00152:Talk(bProcess) 
  NpcAsk({"我家大王最近正在广招门徒,欢迎魔族的有志青年前去,男女不限",
          "南瞻部洲常有野兽出没,路过可要当心了。",
          "听说九头精怪要来拜访我家大王,大王特派我在此迎接",
          "少侠可是要去墨家村？往东北方向一直走便是。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00152)
