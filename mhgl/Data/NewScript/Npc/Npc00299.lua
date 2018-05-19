
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00299 = {							-- 杵官王
	npc_id = 299,						-- NPC ID
	name = GetNpcName(299),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00299:Talk(bProcess) 
  NpcAsk("吾大唐盛世，今有东渡使者进贡的东瀛神社小龟3只，分别命名为：小龟村一郎、小龟蹦二郎、小龟驰三郎。现唐王命我等在此举办小龟快跑大赛，以供臣民开心娱乐，尔等是否有兴趣参与？")
  SetAnswer(1,"我要参加 ")
  SetAnswer(2,"我想了解竞猜规则")
  SetAnswer(3,"小龟客曹部 ")
  SetAnswer(4,"我想查看积分")
  SetAnswer(5,"我要购买小龟点券 ")
  SetAnswer(6,"没事啦 ")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00299)
