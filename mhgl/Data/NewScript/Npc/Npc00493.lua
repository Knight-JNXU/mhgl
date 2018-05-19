
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00493 = {							-- 杵官王
	npc_id = 493,						-- NPC ID
	name = GetNpcName(493),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00493:Talk(bProcess) 
  NpcAsk({"紫子国旁边就是麒麟山，山势险峻，怪石嶙峋，据说还有妖怪出没不过那里盛产珍奇药草。",
         "冬吃萝卜夏吃姜，不劳医生开药方。这位少侠请多多学习下养生之道吧！",
         "神仙看病，也须得先望闻问切，然后再配上老夫的灵丹妙药，保准药到病除。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end     
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00493)
