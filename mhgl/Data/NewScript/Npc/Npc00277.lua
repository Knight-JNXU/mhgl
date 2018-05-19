
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00277 = {							-- 杵官王
	npc_id = 277,						-- NPC ID
	name = GetNpcName(277),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00277:Talk(bProcess) 
  NpcAsk("我受朝廷所托，在此召集十五门派的新入门弟子（30至60级），帮忙处理江湖之事。江湖总有英雄，也少不了坏人作乱。还需要诸位小心分辨!我要提醒一句：江湖险恶，多找几个人一同前往，总之是没有坏处。（需要3人以上组队）")
  SetAnswer(1,"告诉我要怎么做吧！")
  SetAnswer(2,"我要取消任务 ")
  SetAnswer(3,"我要了解这个玩法")
  SetAnswer(4,"少海你好，少海再见")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00277)
