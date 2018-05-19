
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00225 = {							-- 孙小红
	npc_id = 225,						-- NPC ID
	name = GetNpcName(225),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00225:Talk(bProcess)
  NpcAsk({"听巡逻虾兵说附近来了条小龙,不过看上去鬼鬼祟祟的,莫非有什么企图不成?",
         "海底奇幻神秘,地形复杂,可不要迷路了。",
         "不习水性之人到此可要吃尽苦头了",
         "这里很多虾兵,擅长近身攻击。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00225)
