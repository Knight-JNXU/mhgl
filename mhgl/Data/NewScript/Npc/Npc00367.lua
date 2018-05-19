

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00367 = {							-- 杵官王
	npc_id = 367,						-- NPC ID
	name = GetNpcName(367),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00367:Talk(bProcess) 
  NpcAsk("如果你因为一些意外原因遗失了特殊的剧情道具，可以从我这里购买。同时我回收一切你不需要的道具，帮你腾出道具栏空间。注意，我不是物品收购商，回收给我东西你是没有金钱的，还有，剧情道具是不能给予别人的哦。")
  SetAnswer(1,"购买")
  SetAnswer(2,"丢弃 ")
  SetAnswer(3,"我只是来看看。")
  WaitAnswer(3)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00367)
