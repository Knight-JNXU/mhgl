Preload("Quest22103.lua")
Preload("Quest22104.lua")
Preload("Quest55101.lua")
Npc00010 = {							-- 孙小红
	npc_id = 10,						-- NPC ID
	name = GetNpcName(10),				-- NPC 名称
	quests = {Quest30300,Quest22103,Quest22104}
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00010:Talk(bProcess)
  local quest55101 = player:GetQuests():GetQuest(55101)
	local quest30300 = player:GetQuests():GetQuest(30300) 
	if (player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id) or 
		HasQuest(22103) or HasQuest(22104) then
		NpcAsk("咳……咳咳，客官可是来听我老头子说书的？"..RandomLine(10))		
		if player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(1, "师傅好客")
		end
		if HasQuest(22103) or HasQuest(22104) then
			SetAnswer(2,"阵法的迷惑")
		end
		SetAnswer(4, "离开")
		WaitAnswer(4)
		if GetAnswer() == 1 then
			NpcSay("我知道了，你先去回禀你师傅吧，我随后就到。")
			quest30300:FindTargetNPC(1)
			quest30300:SetDescription("事情办完了，回复师傅去吧。")
			quest30300:UpdateData()
		elseif GetAnswer() == 2 then
			if HasQuest(22103) then
				if Quest22103:Return()	then	
					Quest22104:Take()
				end
			elseif HasQuest(22104) then
				Quest22104:Return()
			end
	  end
	else
    NpcAsk("最近天气很好,海上没有大风大浪")
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
 
function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end
 
  
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00010)
