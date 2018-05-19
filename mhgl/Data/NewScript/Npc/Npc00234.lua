
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00234 = {							-- 杵官王
	npc_id = 234,						-- NPC ID
	name = GetNpcName(234),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00234:Talk(bProcess) 
  NpcAsk({"我家老爷是开国功臣，现在正在广招门徒。",
         "心比天高，命比纸薄。我的人生也会如此么？",
         "夫人什么时候再上街呢......好想再见那个小哥一面",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00234)
