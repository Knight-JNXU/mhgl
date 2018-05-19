
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00557 = {							-- 杵官王
	npc_id = 557,						-- NPC ID
	name = GetNpcName(557),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00557:Talk(bProcess) 
  NpcAsk("杀人不是解决问题的唯一办法，如果真的一定要杀了他，我也不拦着你。但你必须知道，受仇恨最大伤害的人，是你和你的朋友。")
  SetAnswer(1,"我确定一定要杀了他！")
  SetAnswer(2,"我来领取勾魂索。（需500万梦幻币抵押）")
  SetAnswer(3,"我来归还勾魂锁。")
  SetAnswer(4,"我要了解勾魂索的使用规则。")
  SetAnswer(5,"我休息下，冷静下就好了。")
  WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00557)
