
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00476 = {							-- 杵官王
	npc_id = 476,						-- NPC ID
	name = GetNpcName(476),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00476:Talk(bProcess) 
  NpcAsk({"当年都说是天蓬调戏我，唉，谁又能知道真正的内情呢。",
       "人人都说神仙好，神仙的烦恼又有谁知道。",
       "我家的玉兔这几天去哪了？还有那捣药的玉杵。?",
       "二郎神真是讨厌，经常派人来扰我清净，看到门口那个康太尉了吗，就是他手下的四大流氓之一。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00476)
