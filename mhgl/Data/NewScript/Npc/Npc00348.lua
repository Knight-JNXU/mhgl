
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00348 = {							-- 杵官王
	npc_id = 348,						-- NPC ID
	name = GetNpcName(348),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00348:Talk(bProcess) 
  NpcAsk({"来往长安的客商越来越多，京城也越发热闹了。",
         "突厥奸细经常会伪装成外地客商来长安城刺探军情，少侠你可要多家留意。",
         "长安城的武器店、饰品店、和服装店出售0级和20级的装备武器。10级的要到建业购买。",
        "苏梦梦和马货商是长安城内的流动商人，每隔一段时间位置会发生变化。" })
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00348)
