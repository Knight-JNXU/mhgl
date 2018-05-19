
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00214 = {							-- 孙小红
	npc_id = 214,						-- NPC ID
	name = GetNpcName(214),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00214:Talk(bProcess)
  NpcAsk({"龙宫里有数不尽的宝贝,有机缘之人才能得到。",
          "年纪越大,越容易犯低级错误。",
          "大家叫我鬼千岁,可我看起来还是那么年轻吧？",
          "生蚝肉怎么这么好吃？"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end
        









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00214)
