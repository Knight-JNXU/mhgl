
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00240 = {							-- 杵官王
	npc_id = 240,						-- NPC ID
	name = GetNpcName(240),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00240:Talk(bProcess) 
  NpcAsk({"当年大闹天宫的齐天大圣就是在这里学艺的。",
       "这里就是灵台方寸山，斜月三星洞。",
       "金木水火土，急急如律令！",
       "菩提祖师管教很严厉，如果拜在他的门下，可要严于律己。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00240)
