
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00368 = {							-- 杵官王
	npc_id = 368,						-- NPC ID
	name = GetNpcName(368),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00368:Talk(bProcess) 
  NpcAsk("现在的学生可是不如以前好带了，你来找我有什么事情吗？")
  SetAnswer(1,"查询在线的时间")
  SetAnswer(2,"查询我的良师值")
  SetAnswer(3,"查询教育记录")
  SetAnswer(4,"删除师徒称谓")
  SetAnswer(5,"我们来确认师徒关系")
  SetAnswer(6,"路过")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00368)
