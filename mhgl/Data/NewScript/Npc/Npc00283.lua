
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00283 = {							-- 杵官王
	npc_id = 283,						-- NPC ID
	name = GetNpcName(283),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00283:Talk(bProcess) 
  NpcAsk("大家快来看看，走过，路过，莫要错过，这位客官是否对我的烟花感兴趣呢？")
  SetAnswer(1,"了解详情")
  SetAnswer(2,"购买烟花")
  SetAnswer(3,"领奖")
  SetAnswer(4,"查看上期获奖情况")
  SetAnswer(5,"离开")
 WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00283)
