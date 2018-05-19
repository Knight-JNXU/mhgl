Quest50006 = {
	quest_id = 50006,							-- 任务 ID
	type_id = 500,								-- 大类 ID
	type_name = "每周活动",
	name = "科举考试",							-- 任务名称
	feature = { "nocancel" },						-- 任务特性
	time_mark = 50006,                          -- 时间标志  
}

function Quest50006:Take()
	local flag = player:GetQuests():GetFlag(50006)	
	local Quest = player:GetQuests():GetQuest(50006) 
	if Quest == nil then
		NpcSay("恭喜少侠通过乡试，现在可以在我这里报名参加会试了。")
		self.descript = "顺利通过了乡试，找乡试考官选择想参加的会试类型吧。##活动结束后可以在京城找魏征删除任务"
		self.target_npc = {{npc_id = npc:GetNpc_id(), map_id = npc:GetMap_id()}}
		player:GetQuests():SetFlag(50006,0) 
		player:GetQuests():SetFlag(444,0)
		player:GetQuests():SetFlag(555,0)
		AddQuest(self)
	else
		NpcAsk("少侠参加什么哪种会试呢？")
		SetAnswer(1, "我参加文试")
--		SetAnswer(2, "我参加武试")
		SetAnswer(3, "离开")
		WaitAnswer(3)
		
		if GetAnswer() == 1 then
			NpcSay("报名成功，请在建邺城（88，158）找\#A1号文考官\#W开始会试。")
			Quest:SetDescription("找到考官开始会试。##活动结束后可以在京城找魏征删除任务")
			Quest:SetTargetNPC(1,300060, 1, 88, 163)
			Quest:SetEndNPC(300060, 1, 88, 163)
			Quest:UpdateData()
			player:GetQuests():SetFlag(50006,1)
			player:GetQuests():SetFlag(444,0)
			player:GetQuests():SetFlag(555,0)
	  end
	end
end
--[[		elseif GetAnswer() == 2 then
			NpcSay("报名成功，请在京城（32，200）找\#A武考官\#W开始会试。")
			Quest:SetDescription("找到考官开始会试。##活动结束后可以在京城找丁敖删除任务")
			Quest:SetTargetNPC( 1,300080, 20300, 32,200)
			Quest:SetEndNPC(300080, 20300, 32,200)
			Quest:UpdateData()
			player:GetQuests():SetFlag(50006,1)
			player:GetQuests():SetFlag(444,0)
			player:GetQuests():SetFlag(555,0)
		end	
		
	end
end--]]

function Quest50006:Return()
end

AddQuestTable(Quest50006)