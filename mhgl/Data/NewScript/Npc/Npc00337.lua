
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00337 = {							-- 杵官王
	npc_id = 337,						-- NPC ID
	name = GetNpcName(337),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00337:Talk(bProcess) 
  NpcAsk("三界之中，英雄辈出：侠士豪杰，以武会友！唯有修为臻至巅峰之士，方可会战于此，痛快一决！是胜是负，切看今日群雄逐鹿！【赛事介绍】")
  SetAnswer(1,"我要报名")
  SetAnswer(2,"我来参赛")
  SetAnswer(3,"查看对阵")
  SetAnswer(4,"排名查询")
  SetAnswer(5,"观看录像")
  SetAnswer(6,"我要投票")
  SetAnswer(7,"我来领奖")
  SetAnswer(8,"路过看看")
  WaitAnswer(8)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00337)
