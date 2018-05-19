

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00313 = {							-- 杵官王
	npc_id = 313,						-- NPC ID
	name = GetNpcName(313),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00313:Talk(bProcess) 
  NpcAsk("我的事情太多，忙不过来，请优先选择一件你最想做的事情吧。（如果你想做的事情不在列表中，请选择“我要做其他事情”）")
  SetAnswer(1,"更改法宝五行")
  SetAnswer(2,"更改召唤兽五行 ")
  SetAnswer(3,"更改装备五行")
  SetAnswer(4,"我点错了")
  WaitAnswer(4)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00313)
