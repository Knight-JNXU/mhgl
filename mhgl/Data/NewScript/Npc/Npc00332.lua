
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00332 = {							-- 杵官王
	npc_id = 332,						-- NPC ID
	name = GetNpcName(332),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00332:Talk(bProcess) 
  NpcAsk({"最近来告状的人好像越来越多了。人族的种族任务找衙门里的李捕头领取。",
         "衙门禁地，闲杂人等不得入内。人族的种族任务找衙门里的李捕头领取。",
         "人气低于500会被三界通缉哦。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00332)
