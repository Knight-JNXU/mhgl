
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00128 = {							-- 孙小红
	npc_id = 128,						-- NPC ID
	name = GetNpcName(128),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00128:Talk(bProcess) 
  NpcAsk({"站住！打劫脚底板~",
          "在江湖上混饭都不容易,重要的是讲义气。",
          "这里丛林密布,靠近国境,是个立山头的好地方。",
          "这念头江湖凶险啊,不如投奔我们吧,保证有吃有喝。",
          "行走江湖靠的是拳头和刀枪,没点真本事是闯不出名堂的。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00128)
