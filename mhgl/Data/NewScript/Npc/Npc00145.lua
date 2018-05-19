Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000145= {	
	npc_id = 145,				
	name = GetNpcName(145),							
}

function Npc000145:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"哎呀,听我家老头子说,最近山里强盗出没,好担心我的孩子们啊！",
          "这荒山野岭的,我那儿媳妇可别出了什么事。",
          "你见到我那儿媳妇了吗?她方才给我儿子送饭去了,都走了半天还没回来。",
          "我那儿媳妇怎么再不回来,我们老两口就要饿死了。",
          
          
          })
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
    NpcAsk({"哎呀,听我家老头子说,最近山里强盗出没,好担心我的孩子们啊！",
          "这荒山野岭的,我那儿媳妇可别出了什么事。",
          "你见到我那儿媳妇了吗?她方才给我儿子送饭去了,都走了半天还没回来。",
          "我那儿媳妇怎么再不回来,我们老两口就要饿死了。",
          
          
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000145)