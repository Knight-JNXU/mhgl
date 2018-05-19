
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00063 = {							-- 孙小红
	npc_id = 63,						-- NPC ID
	name = GetNpcName(63),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00063:Talk(bProcess)
  NpcAsk("我这里出售上好的鱼竿,如果打算钓鱼的话就买上一根钓竿去试试身手吧。想学钓鱼?我只知道本周钓鱼界的绝代高手。")
  SetAnswer(1,"花20000两购买鱼竿")
  SetAnswer(2,"我要出售水产")
  SetAnswer(3,"我要兑换奖励")
  SetAnswer(4,"查看排行榜")
  SetAnswer(5,"我想用积分换鱼")
  SetAnswer(6,"取消")
  WaitAnswer(6)
 end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00063)
