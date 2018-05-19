
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00295 = {							-- 杵官王
	npc_id = 295,						-- NPC ID
	name = GetNpcName(295),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00295:Talk(bProcess) 
  NpcAsk("没错！我就是可爱无敌牌中圣。什么！瞧不起动物吗？我要叫你见识一下我的厉害！")
  SetAnswer(1,"我就是来让你见识什么叫“弓虽”的 ")
  SetAnswer(2,"梦幻卡牌风云赛 ")
  SetAnswer(3,"我想了解梦幻牌的基本玩法")
  SetAnswer(4,"我想找你了解梦幻牌的新玩法")
  SetAnswer(5,"我想了解梦幻牌的玩法")
  SetAnswer(6,"不小心点错了，我闪")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00295)
