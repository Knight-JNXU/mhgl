
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00558 = {							-- 杵官王
	npc_id = 558,						-- NPC ID
	name = GetNpcName(558),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00558:Talk(bProcess) 
  NpcAsk("若是平时和自己的好朋友难舍难分，恨不得永远黏在一起，不妨来我这里结成同袍。")
  SetAnswer(1,"同袍之谊有什么特别？（介绍同袍之谊）")
  SetAnswer(2,"我们要进行同袍的相关操作。")
  SetAnswer(3,"我们来领取同袍技能和称谓。")
  SetAnswer(4,"我想来买点赤金兰花")
  SetAnswer(5,"我来了解纪念日")
  SetAnswer(6,"我路过而已")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00558)
