

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00374 = {							-- 杵官王
	npc_id = 374,						-- NPC ID
	name = GetNpcName(374),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00374:Talk(bProcess) 
  NpcAsk("我是来自梦幻开发测试区“开放测试”的使者，您有兴趣跟我聊聊么？")
  SetAnswer(1,"什么是开发服务器")
  SetAnswer(2,"参加开发测试 ")
  SetAnswer(3,"CC520官方电台挖宝活动参赛选手传档")
  SetAnswer(4,"CC520官方电台挖宝活动幸运观众传档?")
  SetAnswer(5,"原来是火星人，快点回去吧，地球很危险?")
  WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00374)
