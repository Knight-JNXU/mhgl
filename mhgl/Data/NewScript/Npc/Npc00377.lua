

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00377 = {							-- 杵官王
	npc_id = 377,						-- NPC ID
	name = GetNpcName(377),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00377:Talk(bProcess) 
  NpcAsk("我是这里最好的配色师，只要你有足够的颜料，我就可以帮助你把服饰变幻成你最喜欢的颜色。")
  SetAnswer(1,"我想改变形象")
  SetAnswer(2,"存衣服进衣柜")
  SetAnswer(3,"打开我的衣柜  ")
  SetAnswer(4,"给我的孩子改变形象 ")
  SetAnswer(5,"更换孩子饰品的颜色 ")
  SetAnswer(6,"下次再来找你 ")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00377)
