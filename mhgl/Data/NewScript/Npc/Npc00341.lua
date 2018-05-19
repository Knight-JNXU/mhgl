
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00341 = {							-- 杵官王
	npc_id = 341,						-- NPC ID
	name = GetNpcName(341),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00341:Talk(bProcess) 
  NpcAsk({"殷相爷正在休息，没事别再这晃。",
         "这里是天子脚下，太平的很。",
         "相府禁地，闲杂人等不得入内。",
         "殷小姐出家时日已久，也不见回来，可想死老爷和太太了。 ",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00341)
