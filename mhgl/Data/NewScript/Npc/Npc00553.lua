
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00553 = {							-- 杵官王
	npc_id = 553,						-- NPC ID
	name = GetNpcName(553),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00553:Talk(bProcess) 
  NpcAsk({"有人最近在村里见到两个仙风道骨的老人家，有一个好象是寿星，这下我们村可出名啦，连寿星都来过。",
         "眼看就要七夕了，得到布店扯几匹绸缎给咱闺女做件好看的衣裳！",
         "长寿村远近闻名，人杰地灵。",
         "我那女儿都19岁了还没找个人家，我看村的那个钟书生挺上进的，就是不知道女儿对他有没有意思。"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00553)
