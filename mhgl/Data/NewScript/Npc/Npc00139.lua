
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00139 = {							-- 孙小红
	npc_id = 139,						-- NPC ID
	name = GetNpcName(139),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00139:Talk(bProcess) 
  NpcAsk({"你看上去太瘦了,再怎么有诚意地看着我我也不会吃你的。",
          "严肃点,正打劫呢！",
          "好多天没吃人肉了,你就委屈一下做我的午餐吧。",
          "",
          
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00139)
