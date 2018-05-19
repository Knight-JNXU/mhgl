
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
local l_0_0 = {}
l_0_0.npc_id = 700003
l_0_0.name = GetNpcName(700003)
Npc700003 = l_0_0
l_0_0 = Npc700003
l_0_0.Talk = function(l_1_0, l_1_1)
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【巨魔王】")
  SetAnswer(2,"130【巨魔王】")
  SetAnswer(3,"140【巨魔王】")
  SetAnswer(4,"150【巨魔王】")
  SetAnswer(5,"160【巨魔王】")
  SetAnswer(6,"狐美人装备制造")
  SetAnswer(7,"神天兵装备制造")
  SetAnswer(8,"法杖装备制造")
  SetAnswer(9,"宝珠装备制造")
  SetAnswer(10,"弓弩装备制造")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
  if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403284) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403284, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403271, 1)
    ShowHint("120【巨魔王】给你了#46")
	end
  if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403285) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403285, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403272, 1)
    ShowHint("130【巨魔王】给你了#46")
	end
  if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403286) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403286, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403273, 1)
    ShowHint("140【巨魔王】给你了#46")
	end
  if GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403287) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403287, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403400, 1)
    ShowHint("150【巨魔王】给你了#46")
	end
  if GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403280) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403280, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403401, 1)
    ShowHint("160【巨魔王】给你了#46")
	end 
  if GetAnswer() == 6  then
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【狐美人】")
  SetAnswer(2,"130【狐美人】")
  SetAnswer(3,"140【狐美人】")
  SetAnswer(4,"150【狐美人】")
  SetAnswer(5,"160【狐美人】")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403342) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403342, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403304, 1)
    ShowHint("120【狐美人】给你了#46")
  elseif GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403343) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403343, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403305, 1)
    ShowHint("130【狐美人】给你了#46")
	  elseif GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403344) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403344, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403306, 1)
    ShowHint("140【狐美人】给你了#46")
		  elseif GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403345) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403344, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403313, 1)
    ShowHint("150【狐美人】给你了#46")
			  elseif GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403353) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403353, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403314, 1)
    ShowHint("160【狐美人】给你了#46")
   
    end
end
  if GetAnswer() == 7  then
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【神天兵】")
  SetAnswer(2,"130【神天兵】")
  SetAnswer(3,"140【神天兵】")
  SetAnswer(4,"150【神天兵】")
  SetAnswer(5,"160【神天兵】")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403349) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403349, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403332, 1)
    ShowHint("120【神天兵】给你了#46")
  elseif GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403350) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403350, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403333, 1)
    ShowHint("130【神天兵】给你了#46")
	  elseif GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403351) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403351, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403334, 1)
    ShowHint("140【神天兵】给你了#46")
		  elseif GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403352) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403352, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403335, 1)
    ShowHint("150【神天兵】给你了#46")
			  elseif GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403354) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403354, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403336, 1)
    ShowHint("160【神天兵】给你了#46")
   
    end
end
  if GetAnswer() == 8  then
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【法杖】")
  SetAnswer(2,"130【法杖】")
  SetAnswer(3,"140【法杖】")
  SetAnswer(4,"150【法杖】")
  SetAnswer(5,"160【法杖】")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403546) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403546, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403485, 1)
    ShowHint("120【法杖】给你了#46")
  elseif GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403547) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403547, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403486, 1)
    ShowHint("130【法杖】给你了#46")
	  elseif GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403548) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403548, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403487, 1)
    ShowHint("140【法杖】给你了#46")
		  elseif GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403549) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403549, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403494, 1)
    ShowHint("150【法杖】给你了#46")
			  elseif GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403550) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403550, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403495, 1)
    ShowHint("160【法杖】给你了#46")
   
    end
end
  if GetAnswer() == 9 then
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【宝珠】")
  SetAnswer(2,"130【宝珠】")
  SetAnswer(3,"140【宝珠】")
  SetAnswer(4,"150【宝珠】")
  SetAnswer(5,"160【宝珠】")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403562) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403562, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403507, 1)
    ShowHint("120【宝珠】给你了#46")
  elseif GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403563) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403563, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403508, 1)
    ShowHint("130【宝珠】给你了#46")
	  elseif GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403564) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403564, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403509, 1)
    ShowHint("140【宝珠】给你了#46")
		  elseif GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403565) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403565, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403516, 1)
    ShowHint("150【宝珠】给你了#46")
			  elseif GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403566) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403566, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403517, 1)
    ShowHint("160【宝珠】给你了#46")
   
    end
end
  if GetAnswer() == 10 then
  NpcAsk("新角色装备打造")
  SetAnswer(1,"120【弓弩】")
  SetAnswer(2,"130【弓弩】")
  SetAnswer(3,"140【弓弩】")
  SetAnswer(4,"150【弓弩】")
  SetAnswer(5,"160【弓弩】")
  SetAnswer(11,"加急制作中")
  WaitAnswer(11)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403554) < 1 or player:GetItems():GetItemCount(20757) < 2 then
      NpcSay("制造书以及2个强化铁")
      return
    end
    player:GetItems():RemoveItem(403554, 1)
    player:GetItems():RemoveItem(20757, 2)
    player:GetItems():AddItem(403529, 1)
    ShowHint("120【弓弩】给你了#46")
  elseif GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403343) < 1 or player:GetItems():GetItemCount(20758) < 3 then
      NpcSay("制造书以及3个强化铁")
      return
    end
    player:GetItems():RemoveItem(403343, 1)
    player:GetItems():RemoveItem(20758, 3)
    player:GetItems():AddItem(403530, 1)
    ShowHint("130【弓弩】给你了#46")
	  elseif GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403344) < 1 or player:GetItems():GetItemCount(20759) < 4 then
      NpcSay("制造书以及4个强化铁")
      return
    end
    player:GetItems():RemoveItem(403344, 1)
    player:GetItems():RemoveItem(20759, 4)
    player:GetItems():AddItem(403531, 1)
    ShowHint("140【弓弩】给你了#46")
		  elseif GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403345) < 1 or player:GetItems():GetItemCount(20760) < 5 then
      NpcSay("制造书以及5个强化铁")
      return
    end
    player:GetItems():RemoveItem(403344, 1)
    player:GetItems():RemoveItem(20760, 5)
    player:GetItems():AddItem(403539, 1)
    ShowHint("150【弓弩】给你了#46")
			  elseif GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(403353) < 1 or player:GetItems():GetItemCount(20762) < 6 then
      NpcSay("制造书以及6个强化铁")
      return
    end
    player:GetItems():RemoveItem(403353, 1)
    player:GetItems():RemoveItem(20762, 6)
    player:GetItems():AddItem(403539, 1)
    ShowHint("160【弓弩】给你了#46")
   
    end
end
end

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc700003)
