
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00298 = {							-- 杵官王
	npc_id = 298,						-- NPC ID
	name = GetNpcName(298),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00298:Talk(bProcess) 
  NpcAsk("看见我名字没，我可和那两个家伙不一样，和我玩牌就要做好输的准备啦：如果你能赢我，呃......")
  SetAnswer(1,"让你见识下我有多厉害 ")
  SetAnswer(2,"梦幻卡牌风云赛 ")
  SetAnswer(3,"查询我的牌艺积分")
  SetAnswer(4,"我要领取牌艺称谓")
  SetAnswer(5,"我想了解梦幻牌的玩法")
  SetAnswer(6,"手一滑点错了，不好意思")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00298)
