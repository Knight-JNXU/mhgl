
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00339 = {							-- 杵官王
	npc_id = 339,						-- NPC ID
	name = GetNpcName(339),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00339:Talk(bProcess) 
  NpcAsk({"化生寺的空度禅师也在招收徒弟，有兴趣的可以去试试。化生寺的入口在长安大雁塔后面。",
         "听人说大唐官府的程咬金将军在广招徒弟，不知道谁能有幸拜在他的门下。大唐官府的入口在长安天台的后面。",
         "秦琼将军掌管着点卡寄售处，如有需要随时可以去秦府后院看看",
        "好男儿应当入我军营，为国效力。" })
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00339)
