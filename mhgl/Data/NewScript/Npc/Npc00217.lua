
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00217 = {							-- 孙小红
	npc_id = 217,						-- NPC ID
	name = GetNpcName(217),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00217:Talk(bProcess)
  NpcAsk({"论智慧我比蟹将军高那么一点点,可是他比我多了好多手脚,所以比我升的快。",
          "有志的仙族青年应该投奔我龙宫,及早某个好前程啊。",
          "不想当龙虾的虾不是好虾。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00217)
