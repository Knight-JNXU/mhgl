Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest69207.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00065 = {							-- 孙小红
	npc_id = 65,						-- NPC ID
	name = GetNpcName(65),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00065:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	local quest69207 = player:GetQuests():GetQuest(69207)

	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"从傲来国向左上走可以到女儿村,那里的孙婆婆正在招收门徒,不过只收女弟子哦",
          "从花果山可以下到龙宫,还可以传送到北俱芦洲"})
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		if (HasQuest(69207) and quest69207:GetEndNpcId() == self.npc_id) then
		  SetAnswer(2, "官职任务")
		end
	
	
		SetAnswer(3, "离开")
		WaitAnswer(3)
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
	  elseif GetAnswer() == 2 then
		  Quest69207:Return()
		end
	else
    NpcAsk({"从傲来国向左上走可以到女儿村,那里的孙婆婆正在招收门徒,不过只收女弟子哦",
          "从花果山可以下到龙宫,还可以传送到北俱芦洲"})
    SetAnswer(1,"离开")
    WaitAnswer(1)	
	end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00065)
