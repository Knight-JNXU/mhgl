
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00477 = {							-- 孙小红
	npc_id = 477,						-- NPC ID
	name = GetNpcName(477),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00477:Talk(bProcess) 
  NpcAsk({"仙家灵丹有着奇特的功效,凡夫俗子吃上一颗,可以延年益寿百病全消。",
          "几年前齐天大圣那一闹我到现在还记得,真是厉害,连炼丹炉都烧不死他。",
          "远客来此可是来炼丹？"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00477)
