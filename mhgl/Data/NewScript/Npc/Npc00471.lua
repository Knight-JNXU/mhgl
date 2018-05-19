
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00471 = {							-- 杵官王
	npc_id = 471,						-- NPC ID
	name = GetNpcName(471),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00471:Talk(bProcess) 
  NpcAsk({"这嫦娥也真是的，跟了我们真君有什么不好。",
       "这月宫有什么好的？冷冷清清戚戚惨惨切切，哪里有那长安城热闹",
       "我们老大就是人称玉面无敌的多情公子二郎神，怎么样，怕了吧！",
       "我们康张姚李四太尉是二郎神手下的四大护法金刚！",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00471)
