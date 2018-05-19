Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00148 = {							-- 孙小红
	npc_id = 148,						-- NPC ID
	name = GetNpcName(148),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00148:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
 
  NpcAsk("我的事情太多,忙不过来,请优先选择一件你最想做的事情吧。(如果你想做的事情不再列表中,请选择“#Y我要做其他事情#W”)") 
  SetAnswer(1,"学习技能")
  SetAnswer(2,"我要做其他事情")
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
		SetAnswer(3, "任务链")
  end
  SetAnswer(4,"我点错了")
  WaitAnswer(4)
  if GetAnswer() == 3 then
		if HasQuest(26001) then
			Quest26001:Return()
		elseif HasQuest(26002) then
			Quest26002:Return()
		elseif HasQuest(26003) then
			Quest26003:Return()
		elseif HasQuest(26004) then
			Quest26004:Return()
		end
	end
end




          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00148)
