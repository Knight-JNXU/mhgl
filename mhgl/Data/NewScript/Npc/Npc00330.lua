
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00330 = {							-- 杵官王
	npc_id = 330,						-- NPC ID
	name = GetNpcName(330),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00330:Talk(bProcess) 
  NpcAsk("我是负责审批房屋建造的，你想做房屋么？")
  SetAnswer(1,"我要建房")
  SetAnswer(2,"我要拆房 ")
  SetAnswer(3,"我要搬家 ")
  SetAnswer(4,"申请扩建 ")
  SetAnswer(5,"我想将家迁入/迁出社区的土地 ")
  SetAnswer(6,"我想要为自己的庭院扩容 ")
  SetAnswer(7,"我想拥有一个菜园子 ")
  SetAnswer(8,"我想出售自己的房屋 ")
  SetAnswer(9,"我想转让自己的房屋 ")
  SetAnswer(10,"离开 ")
  WaitAnswer(10)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00330)
