
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00275 = {							-- 杵官王
	npc_id = 275,						-- NPC ID
	name = GetNpcName(275),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00275:Talk(bProcess) 
  NpcAsk("欢迎来到长安城，长安是唐朝政治、经济、文化中心。建议你用Tab键打开小地图欣赏一下这座宏伟的都城。")
  SetAnswer(1,"1、我想了解一下长安的情况。 ")
  SetAnswer(2,"2、我想了解一下如何拜师学艺。 ")
  SetAnswer(3,"3、我想知道怎么升级和赚钱。")
  SetAnswer(4,"4、我想知道一下有什么任务可做。")
  SetAnswer(5,"5、我想领取“新手游长安”任务")
  SetAnswer(6,"6、谢谢，我自己去摸索吧。")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00275)
