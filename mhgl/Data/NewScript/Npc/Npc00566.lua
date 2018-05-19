
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00566 = {							-- 杵官王
	npc_id = 566,						-- NPC ID
	name = GetNpcName(566),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00566:Talk(bProcess) 
  NpcAsk({"长寿村山清水秀，是钓鱼休闲的好地方。",
         "任务链领取的NPC就在长寿村左下，叫做陆萧。",
         "神仙打架，凡人遭殃。我早就厌倦了天上的明争暗斗了。",
         "长寿村风景秀丽，民风淳朴，是难得的休闲之所。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00566)
