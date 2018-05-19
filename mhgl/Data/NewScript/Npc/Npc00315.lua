
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00315 = {							-- 杵官王
	npc_id = 315,						-- NPC ID
	name = GetNpcName(315),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00315:Talk(bProcess) 
  NpcAsk("为了让那些不能参加帮派竞赛的帮派能有一个体验竞赛魅力的机会，帮派协会决定在每月相同时间举办一场帮派试炼赛，每个帮派均可同时报名参加帮派竞赛和帮派试炼赛，如果帮派赛落选，则可以继续参加帮派活动，一点也不耽误哦。")
  SetAnswer(1,"我要报名帮派试炼赛")
  SetAnswer(2,"送我去活动场地")
  SetAnswer(3,"对战表")
  SetAnswer(4,"贡献榜")
  SetAnswer(5,"租赁角色修炼")
  SetAnswer(6,"帮派成绩榜")
  SetAnswer(7,"我只是来看看")
  WaitAnswer(7)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00315)
