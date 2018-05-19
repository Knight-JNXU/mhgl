Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest10031.lua")
Preload("Quest10032.lua")
Npc000136= {	
	npc_id = 136,				
	name = GetNpcName(136)
	
}

function Npc000136:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	local quest_ids = {10031,10032}
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) or 
		HasQuest(quest_ids) then 
    NpcAsk({"总算是摆脱了寿星老头的控制,可是自由自在的生活了。",
          "南极仙翁那里包吃包住,其实生活也算不错。",
          "我有个远房亲戚,他可是三界的神兽,在长安城天台你就能看见他。",
          "在我看来神仙都是些唧唧歪歪婆婆妈妈的家伙,真不知道为什么那么多人会崇拜神仙。",
          })
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		if HasQuest(quest_ids) or player:GetLevel() >= 25 then 
		  SetAnswer(2, "主线任务")
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
	    NpcAsk("那些神仙有什么好,一天到晚啰里啰嗦,那有我现在这样逍遥自在,不如你也加入我们,跟着我一起享受这幸福日子如何?")
	    SetAnswer(1,"快点跟我回去(触发战斗)")
	    SetAnswer(2,"我早就看不惯哪些神仙了")
	    SetAnswer(3,"让我想想")
	    WaitAnswer(3)
	    if GetAnswer() == 1 then
	      if HasQuest(10031) then
	        if Quest10031:Return() then
	          Quest10032:Take()
	        end
	      elseif HasQuest(10032) then
	        if Quest10032:Return() then
	          Quest10033:Take()
	        end
	      end
	    elseif GetAnswer() == 2 then
	      NpcSay("这就是送给你的见面礼了！")
	      
	      
	      
	    end
	  end
	else
    NpcAsk({"总算是摆脱了寿星老头的控制,可是自由自在的生活了。",
          "南极仙翁那里包吃包住,其实生活也算不错。",
          "我有个远房亲戚,他可是三界的神兽,在长安城天台你就能看见他。",
          "在我看来神仙都是些唧唧歪歪婆婆妈妈的家伙,真不知道为什么那么多人会崇拜神仙。",
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000136)