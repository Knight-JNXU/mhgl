
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00314 = {							-- 杵官王
	npc_id = 314,						-- NPC ID
	name = GetNpcName(314),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00314:Talk(bProcess) 
  NpcAsk("装备需要通过开运增加开运孔数才能进行符石镶嵌，而点化此乃上古秘传道术。贫道近期正修炼此法，你有兴趣的话可以来试试。你可以考虑清楚，贫道虽习得此法，但道行修行尚浅，且需运筹乾坤，难免开运失败。")
  SetAnswer(1,"我来给装备开运")
  SetAnswer(2,"点化装备星位")
  SetAnswer(3,"我来合成符石")
  SetAnswer(4,"分解装备")
  SetAnswer(5,"我可不想给装备开运")
  WaitAnswer(5)
end


















function Npc00314:GetAwo()
  NpcSay("100级ok")
end

function Npc00314:GetBwo()
  NpcSay("110级ok")
end

function Npc00314:GetCwo()
  NpcSay("120级ok")
end

function Npc00314:GetDwo()
  NpcSay("130级ok")
end

function Npc00314:GetEwo()
  NpcSay("140级ok")
end

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00314)
