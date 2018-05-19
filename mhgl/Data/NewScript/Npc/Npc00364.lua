
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00364 = {							-- 杵官王
	npc_id = 364,						-- NPC ID
	name = GetNpcName(364),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00364:Talk(bProcess) 
  NpcAsk({"皇上已经好几天睡不好觉了，都是被那个什么鬼闹的。",
         "自从服用了西域珍馐红罗羹，气色好了，烦恼也没了，让我的美由内而外的散发出来！",
         "自古红颜多薄命，我也会如此么？",
         "伴君如伴虎，文武百官，后宫嫔妃，莫不如此。 ",
         "锦绣衣裳白玉楼，最繁华时最忧愁。谁又能理解我现在的心情。"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00364)
