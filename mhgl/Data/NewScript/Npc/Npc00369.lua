
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00303 = {							-- 杵官王
	npc_id = 303,						-- NPC ID
	name = GetNpcName(303),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00303:Talk(bProcess) 
  NpcAsk("在下专门负责收徒及出师仪式。无论是收徒拜师，都来找在下就对了，若是已经收徒，可以找我旁边的国子监司业领取师徒任务。")
  SetAnswer(1,"怎样拜师或收徒？ ")
  SetAnswer(2,"我来带徒弟拜师 ")
  SetAnswer(3,"我来带徒弟出师")
  SetAnswer(4,"我想解除师徒关系")
  SetAnswer(5,"我要兑换奖励")
  SetAnswer(6,"领取良师册/修学录")
  SetAnswer(7,"我只是来看看热闹")
  WaitAnswer(7)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00303)
