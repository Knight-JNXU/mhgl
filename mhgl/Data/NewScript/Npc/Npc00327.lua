
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00317 = {							-- 杵官王
	npc_id = 317,						-- NPC ID
	name = GetNpcName(317),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00317:Talk(bProcess) 
  NpcAsk({"来和我一起玩好不好，我和两个弟弟玩做迷藏，帮我找他们。",
         "叔叔阿姨你们有弹弓么？",
         "陪我去城外玩嘛......",
         "小麻雀，叫喳喳......",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00317)
