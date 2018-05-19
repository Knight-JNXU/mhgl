

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00367 = {							-- 杵官王
	npc_id = 367,						-- NPC ID
	name = GetNpcName(367),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00367:Talk(bProcess) 
  NpcAsk("“幻境寻宝”活动在每周的周二，周四，周日举行。报名时间为举行活动当天的18:00至19:30，如果组队报名的话有机会被分到一个队伍哦。报名队员在入场时需要缴纳等级*150的保证金，寻宝活动结束后返还。入场时间为活动当天的19:30至20:00，到时大家来找我就好啦。")
  SetAnswer(1,"我来报名参加“幻境夺宝”的活动")
  SetAnswer(2,"我来进场参加“幻境夺宝”的活动 ")
  SetAnswer(3,"我想了解“幻境夺宝”活动的规则")
  SetAnswer(4,"我随便看看的")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00367)
