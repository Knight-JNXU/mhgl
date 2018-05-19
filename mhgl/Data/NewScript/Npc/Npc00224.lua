
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00224 = {							-- 孙小红
	npc_id = 224,						-- NPC ID
	name = GetNpcName(224),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00224:Talk(bProcess)
  NpcAsk({"听巡逻虾兵说附近来了条小龙,不过看上去鬼鬼祟祟的,莫非有什么企图不成?",
          "海底奇幻神秘,地形复杂,可不要迷路了。挺巡逻虾兵说附近来了条小龙,不过看上去鬼鬼祟祟的,莫非有什么企图不成？",
          "如果没在海底迷宫迷过路,那你的梦幻人生可真是不完整。",
          "这里的怪物大部分使用法术攻击,可要注意了。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00224)
