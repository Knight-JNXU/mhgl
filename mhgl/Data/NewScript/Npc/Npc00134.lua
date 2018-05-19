Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000134= {	
	npc_id = 134,				
	name = GetNpcName(134),							
}

function Npc000134:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"我们二郎神君想要个把女人还不容易,不知怎么偏偏看上了这个不知好歹的小妮子。",
          "人称风度翩翩风流倜傥凤妃天下少女的天下第一帅哥就是我们二郎神君。",
          "二郎神的庙宇位于灌江口,那里可是块风水宝地。",
          "我们康张姚李四大太尉可是二郎神手下的四大天王。",
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
    NpcAsk({"我们二郎神君想要个把女人还不容易,不知怎么偏偏看上了这个不知好歹的小妮子。",
          "人称风度翩翩风流倜傥凤妃天下少女的天下第一帅哥就是我们二郎神君。",
          "二郎神的庙宇位于灌江口,那里可是块风水宝地。",
          "我们康张姚李四大太尉可是二郎神手下的四大天王。",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000134)