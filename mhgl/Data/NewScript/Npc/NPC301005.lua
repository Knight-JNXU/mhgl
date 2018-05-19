local l_0_0 = {}
l_0_0.npc_id = 301005
l_0_0.name = GetNpcName(301005)
Npc301005 = l_0_0
l_0_0 = Npc301005
l_0_0.Talk = function(l_1_0, l_1_1)
  NpcAsk("是否兑换盒子（每一样物品都要额外收20个四相哦）")
  SetAnswer(6,"乾元丹")
  SetAnswer(1,"普通盒子")
  SetAnswer(2,"低级盒子低级碎片5个兑换")
  SetAnswer(3,"中级盒子中级碎片5个兑换")
  --SetAnswer(4,"高级盒子高级碎片5个兑换")
  SetAnswer(5,"离开")
  WaitAnswer(5)
  if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 20 or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 or player:GetItems():GetItemCount(15009) < 20 then
      NpcSay("凑齐青龙石，白虎石，朱雀石，玄武石各20个哦")
      return
    end
    player:GetItems():RemoveItem(15006, 20)
    player:GetItems():RemoveItem(15007, 20)
    player:GetItems():RemoveItem(15008, 20)
    player:GetItems():RemoveItem(15009, 20)
    player:GetItems():AddItem(600010, 1)
    ShowHint("普通盒子给你了哦#46")
  end
  if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 20 or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 or player:GetItems():GetItemCount(15009) < 20 or player:GetItems():GetItemCount(444444) < 5 then
      NpcSay("凑齐青龙石，白虎石，朱雀石，玄武石各20个还有碎片哦")
      return
    end
    player:GetItems():RemoveItem(15006, 20)
    player:GetItems():RemoveItem(15007, 20)
    player:GetItems():RemoveItem(15008, 20)
    player:GetItems():RemoveItem(15009, 20)
	player:GetItems():RemoveItem(444444, 5)
    player:GetItems():AddItem(600011, 1)
    ShowHint("低级盒子给你了哦#46")
  end
  if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 20 or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 or player:GetItems():GetItemCount(15009) < 20 or player:GetItems():GetItemCount(444445) < 5 then
      NpcSay("凑齐青龙石，白虎石，朱雀石，玄武石各20个还有碎片哦")
      return
    end
    player:GetItems():RemoveItem(15006, 20)
    player:GetItems():RemoveItem(15007, 20)
    player:GetItems():RemoveItem(15008, 20)
    player:GetItems():RemoveItem(15009, 20)
	player:GetItems():RemoveItem(444445, 5)
    player:GetItems():AddItem(600012, 1)
    ShowHint("中级盒子给你了哦#46")
	end
	 if GetAnswer() == 6 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 20 or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 or player:GetItems():GetItemCount(15009) < 20 then
      NpcSay("凑齐青龙石，白虎石，朱雀石，玄武石各20个")
      return
    end
    player:GetItems():RemoveItem(15006, 20)
    player:GetItems():RemoveItem(15007, 20)
    player:GetItems():RemoveItem(15008, 20)
    player:GetItems():RemoveItem(15009, 20)
    player:GetItems():AddItem(402850, 1)
    ShowHint("乾元丹给你了哦#46")
  end
  end
 









 AddNpcTable(Npc301005)
