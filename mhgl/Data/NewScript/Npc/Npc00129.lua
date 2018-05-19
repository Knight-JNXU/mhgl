
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00129 = {							-- 孙小红
	npc_id = 129,						-- NPC ID
	name = GetNpcName(129),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00129:Talk(bProcess) 
  NpcAsk({"我这么有型,晶晶姑娘为什么对我的潇洒形象一点反应也没有呢？",
          "别人笑我太疯癫,我笑别人看不穿。",
          "晶晶姑娘说,她在我心里留下了一点东西,你说会是什么呢？会不会是……烤鸡翅膀？",
          "长夜漫漫,无心睡眠--少侠你也睡不着啊？",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00129)
