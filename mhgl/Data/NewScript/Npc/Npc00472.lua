
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00472 = {							-- 杵官王
	npc_id = 472,						-- NPC ID
	name = GetNpcName(472),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00472:Talk(bProcess) 
  NpcAsk({"天宫里有天宫里的规矩，你若无事就请回去吧，不要打扰我家仙子。",
       "听说紫霞仙子和嫦娥姐姐一样美丽。",
       "月桂树下的吴刚，不知何日才能脱离苦海?",
       "人人都羡慕嫦娥仙子能够永享仙籍，长葆青春，可又有谁能了解她心中的孤独和寂寞。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00472)
