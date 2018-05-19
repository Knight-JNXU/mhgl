
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00140 = {							-- 孙小红
	npc_id = 140,						-- NPC ID
	name = GetNpcName(140),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00140:Talk(bProcess) 
  NpcAsk({"你见到鬼不害怕吗？",
          "牡丹花下死,做鬼也风流",
          "为什么我一直都不能进入轮回,真奇怪,我也想投胎啊。",
          "五庄观就在附近,听说镇元大仙正在广招仙族弟子,不过只收男的。",
          
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00140)
