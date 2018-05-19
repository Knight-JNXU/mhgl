
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00172 = {							-- 杵官王
	npc_id = 172,						-- NPC ID
	name = GetNpcName(172),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00172:Talk(bProcess) 
  NpcAsk({"加入我们狮驼岭，保证你有吃有喝，前途无量。",
       "这里有三位大王各有一手看家本领，说出来怕会吓死你。",
       "我们狮驼岭的小妖，光是有名有姓的就有四万七八千。",
       "我家的三个大王分别住在三个山洞里。",
       "我家的三个大王神通广大，就是神仙来也得让着三分。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00172)
