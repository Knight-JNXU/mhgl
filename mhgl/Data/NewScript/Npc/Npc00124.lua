Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000124= {	
	npc_id = 124,				
	name = GetNpcName(124),							
}

function Npc000124:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"如今真是太平,这斩妖台也荒废许久了。",
          "虽然名号相近,可是要比力气,大力金刚在我面前可得甘拜下风。",
          "虽然说潇洒我比玉帝差了点,说英俊比二郎神丑了点,说风度我笔李天王少了点……可是,我是真心喜欢月香姑娘的啊,她为什么不喜欢我呢？"})
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
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
		end
	else
    NpcAsk({"如今真是太平,这斩妖台也荒废许久了。",
          "虽然名号相近,可是要比力气,大力金刚在我面前可得甘拜下风。",
          "虽然说潇洒我比玉帝差了点,说英俊比二郎神丑了点,说风度我笔李天王少了点……可是,我是真心喜欢月香姑娘的啊,她为什么不喜欢我呢？"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000124)