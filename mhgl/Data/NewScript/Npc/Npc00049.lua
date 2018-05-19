Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest55101.lua")
Preload("Quest69207.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00049 = {							-- 孙小红
	npc_id = 49,						-- NPC ID
	name = GetNpcName(49),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00049:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
  local quest55101 = player:GetQuests():GetQuest(55101)
  local quest69207 = player:GetQuests():GetQuest(69207)

	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
		NpcAsk("江南野外常有些山野精怪出没,经过的话最好多找几个同伴。")
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
    if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
      SetAnswer(2, "建设任务")
    end
		if (HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) then
		  SetAnswer(3, "官职任务")
		end
		SetAnswer(4, "离开")
		WaitAnswer(4)
		if GetAnswer() == 1 then
			if HasQuest(26001) then
				Quest26001:Return()
			elseif HasQuest(26002) then
				Quest26002:Return()
			elseif HasQuest(26003) then
				Quest26003:Return()
			elseif HasQuest(26004) then
				Quest26004:Return()
			end
	  elseif GetAnswer() == 3 then
		  Quest69207:Return()
		end
	else
    NpcAsk("江南野外常有些山野精怪出没,经过的话最好多找几个同伴。")
    if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
      SetAnswer(1, "建设任务")
    end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
      ISay("本帮山庄建设中，还请阁下多多帮忙。")
      NpcSay("没问题，回复你们总管就说包在我身上了。")
      if quest55101:GetTargetNpcId(1) == self.npc_id then
        quest55101:FindTargetNPC(1)
      else
        quest55101:FindTargetNPC(2)
      end
      quest55101:UpdateData()
    end
  end
end



-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00049)
