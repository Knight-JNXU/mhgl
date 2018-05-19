
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00290 = {							-- 杵官王
	npc_id = 290,						-- NPC ID
	name = GetNpcName(290),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00290:Talk(bProcess) 
  NpcAsk("大红喜轿，锣鼓开道，喜气盈门......雇佣喜轿游长安，甜甜蜜蜜的风光一次，让所有人分享你们的喜悦吧！（结婚当天，结婚纪念日享受八折优惠）(她）能惊喜一下。我专门负责礼物包装，有需要的话可以找我哦。")
  SetAnswer(1,"我要雇佣喜轿")
  SetAnswer(2,"给我看看这些依仗的报价 ")
  SetAnswer(3,"我只是看看热闹 ")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00290)
