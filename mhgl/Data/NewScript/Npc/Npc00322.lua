

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00322 = {							-- 杵官王
	npc_id = 322,						-- NPC ID
	name = GetNpcName(322),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00322:Talk(bProcess) 
  NpcAsk("所有在拍卖行中购买的物品和召唤兽以及退还的押金都将由我暂时替您保管。托管的东西务必周五早上10点前取回。")
  SetAnswer(1,"我想了解保管系统")
  SetAnswer(2,"设置预定提醒列表 ")
  SetAnswer(3,"取出物品")
  SetAnswer(4,"取出召唤兽")
  SetAnswer(5,"离开")
  WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00322)
AddNpcTable(Npc00322)
