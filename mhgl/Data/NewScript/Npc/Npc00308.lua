

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00308 = {							-- 杵官王
	npc_id = 308,						-- NPC ID
	name = GetNpcName(308),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00308:Talk(bProcess) 
  NpcAsk("凡尘之内，别有洞天，洞天超脱三界，不在五行，缩地成尺，沟通天堑。有花鸟虫兽，岩穴石窟，自成规矩，亦上仙游玩之处也。")
  SetAnswer(1,"我要学习技能")
  SetAnswer(2,"此技能有何用？ ")
  SetAnswer(3,"我要用积分兑换奖励")
  SetAnswer(4,"没兴趣?")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00308)
