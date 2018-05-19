
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00170 = {							-- 杵官王
	npc_id = 170,						-- NPC ID
	name = GetNpcName(170),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00170:Talk(bProcess) 
  NpcAsk({"我们寨主就是人称平天大圣的牛魔王！",
       "我们大王正在和九头虫喝酒呢。",
       "自从大王修炼除了五火神焰印，我们寨子一下就人丁兴旺起来了。",
       "加入魔王寨，保你有吃有喝，没人敢再欺负你。",
       "别看齐天大圣厉害，见到我们大王在不一样得叫大哥！",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00170)
