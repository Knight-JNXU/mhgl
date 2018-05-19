Preload("Quest69204.lua")
Preload("Quest69205.lua")
Npc300467 = {npc_id = 300467, name = GetNpcName(300467), 
quests = {Quest69300, Quest69301, Quest69302}}
Npc300467.Talk = function(self, bProcess)
  local flag = player:GetQuests():GetFlag(820)
  local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
  NpcAsk("#P开服我们是认真的")
  SetAnswer(1, "进入绑定元宝商城")
  SetAnswer(2, "没事溜达")
  WaitAnswer(2)
    if GetAnswer() == 1 then
        if not bProcess then
          return 
        end
        script:SetSaying(true)
        script:SetAsking(true)
		local num = player:GetQuests():GetNpcFlag(300461, Day, 0)
		NpcAsk(string.format("想和我们一起闯荡，不仅需要雄厚的实力，还要有足够的运气哦！\r你的绑定元宝为：#R %d", flag))
		--SetAnswer(1, "具体方法请指教")
		--SetAnswer(2, "我来参与稀有同伴的抽奖")
		SetAnswer(4, "进入绑定元宝道具商城")
		--SetAnswer(5, "进入绑定元宝残篇抽奖")
		SetAnswer(6, "好的，我明白了")
		WaitAnswer(6)
	if GetAnswer() == 4 then
	script:SetSaying(true)
		NpcAsk(string.format("欢迎来到本商城，祝您购物愉快！\r你的绑定元宝为：#R %d", flag))
		SetAnswer(1, "199999善恶有报")
		--SetAnswer(2, "8999购买特制资质丹礼包")
		--SetAnswer(3, "2999购买秘制资质丹礼包")
		--SetAnswer(4, "99购买修炼丹")
		--SetAnswer(5, "3000购买通用元宝票（500）")
		--SetAnswer(6, "3000购买稀有同伴礼包")
		SetAnswer(7, "15000购买高级兽决宝盒")
		--SetAnswer(8, "10000购买坐骑-草尼马")	
		--SetAnswer(9, "58888购买神兽-青鸾")		
		--SetAnswer(10, "20000购买高级秘籍宝盒x10")
		--SetAnswer(11, "200000购买高级秘籍宝盒x100")		
		SetAnswer(12, "500购买超级金柳露")	
		SetAnswer(13, "9999购买水漫金山")
		SetAnswer(14, "9999购买指南书宝盒")			
		SetAnswer(15, "我就看看")
		WaitAnswer(15)
	if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 199999 then
        NpcSay("你的余额不足#R199999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 199999)
      player:GetItems():AddItem(40043, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y高级兽决#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 8999 then
        NpcSay("你的余额不足#R8999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 8999)
      player:GetItems():AddItem(401648, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y特质资质丹礼包#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 2999 then
        NpcSay("你的余额不足#R2999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 2999)
      player:GetItems():AddItem(401647, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y秘制资质丹礼包#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 99 then
        NpcSay("你的余额不足#R99")
        return
      end
      player:GetQuests():SetFlag(820, flag - 99)
      player:GetItems():AddItem(80053, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y修炼丹#26", player:GetName()), false)
      player:GetOwner()
    end
		if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 3000 then
        NpcSay("你的余额不足#R3000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 3000)
      player:GetItems():AddItem(61021, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y通用元宝票（500）#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 3000 then
        NpcSay("你的余额不足#R3000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 3000)
      player:GetItems():AddItem(402745, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y稀有同伴礼包#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 15000 then
        NpcSay("你的余额不足#R15000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 15000)
      player:GetItems():AddItem(63060, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y高级兽决宝盒#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 10000 then
        NpcSay("你的余额不足#R10000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 10000)
player:GetPets():AddPet(RandTable{302})
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个坐骑#Y草尼马#26", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 58888 then
        NpcSay("你的余额不足#R58888")
        return
      end
      player:GetQuests():SetFlag(820, flag - 58888)
      player:GetPartners():AddPartner(7094)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y神兽-青鸾#26", player:GetName()), false)
      player:GetOwner()
    end		
	if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 20000 then
        NpcSay("你的余额不足#R20000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 20000)
      player:GetItems():AddItem(63028, 10)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y高级秘籍宝盒x10#26", player:GetName()), false)
      player:GetOwner()
    end				
	if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 200000 then
        NpcSay("你的余额不足#R200000")
        return
      end
      player:GetQuests():SetFlag(820, flag - 200000)
      player:GetItems():AddItem(63028, 100)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y高级秘籍宝盒x100#26", player:GetName()), false)
      player:GetOwner()
    end		
	if GetAnswer() == 12 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 500 then
        NpcSay("你的余额不足#R500")
        return
      end
      player:GetQuests():SetFlag(820, flag - 500)
      player:GetItems():AddItem(30001, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y超级金柳露#26", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 13 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 9999 then
        NpcSay("你的余额不足#R9999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 9999)
      player:GetItems():AddItem(60204, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y高级兽决#26", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 14 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 9999 then
        NpcSay("你的余额不足#R9999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 9999)
      player:GetItems():AddItem(60230, 1)
      script:Rumor(string.format("#Y[绑完元宝商城]#E %s #O在积分使者那里兑换了一个#Y指南书宝盒#26", player:GetName()), false)
      player:GetOwner()
    end	
	end
	if GetAnswer() == 5 then
	script:SetSaying(true)
		NpcAsk(string.format("欢迎来到本商城，祝您购物愉快！\r你的绑定元宝为：#R %d", flag))
		SetAnswer(1, "59999残篇抽奖")			
		SetAnswer(15, "我就看看")
		WaitAnswer(15)
	if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(820)
      script:SetSaying(true)
      if flag < 59999 then
        NpcSay("你的余额不足#R59999")
        return
      end
      player:GetQuests():SetFlag(820, flag - 59999)
      itemid = RandTable({402762, 402763, 402764, 402767, 402766, 402764, 402764, 402764, 402764})
	player:GetItems():AddItem(itemid, 2)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format("#Y[绑完元宝商城]#E%s #O在积分使者那里抽奖中了#B%sX2#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
      player:GetOwner()
    end	
	end			
end
end

AddNpcTable(Npc300467)



