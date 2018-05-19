

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00282 = {							-- 杵官王
	npc_id = 282,						-- NPC ID
	name = GetNpcName(282),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00282:Talk(bProcess) 
  NpcAsk("您好，我是长安房都尉，专门负责提醒您账号安全。我这里有几个小题目，您能答对的话，会有小奖励哦")
  SetAnswer(1,"我来参加考验")
  SetAnswer(2,"我要加时间锁 ")
  SetAnswer(3,"我要解时间锁")
  SetAnswer(4,"领取支线任务")
  SetAnswer(5,"我想了解作用")
  SetAnswer(6,"我想了解时间锁")
  SetAnswer(7,"我想了解考验规则")
  SetAnswer(8,"我要了解特殊（转服）时间锁")
  SetAnswer(9,"我来随便看看")
  WaitAnswer(9)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00282)
