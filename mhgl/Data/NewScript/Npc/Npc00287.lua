


Npc00287 = {							
	npc_id = 00287,				--战斗雪人明雷
	name = GetNpcName(00287),	
}


function Npc00287:Talk(bProcess)
  NpcAsk("你能帮我找回遗失的孩子嘛")
  if player:GetItems():GetItemCount(600009)  > 0 then 
  SetAnswer(1,"获取奖励")
  end
  SetAnswer(2,"辅助类孩子")
  SetAnswer(3,"攻击类孩子")
  SetAnswer(7,"离开")
  WaitAnswer(7)
	if GetAnswer() == 1 and bProcess then
    player:GetItems():RemoveItem(600009, 1)
    player:GetItems():AddItem(600003, 1)
    ShowHint("集齐30个即可领取孩子") 
	end
	if GetAnswer() == 2 and bProcess then
    if player:GetItems():GetItemCount(600003) < 30 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
    player:GetItems():RemoveItem(600003, 30)
player:GetPartners():AddPartner(RandTable({7088}), 1)
         ShowHint("#B领取成功，恭喜你")
    script:Rumor(string.format("#W%s#O恭喜，领取了走失的孩子，带上他一起战斗吧！#046#46", player:GetName()), false)
  end
  if GetAnswer() == 3 and bProcess then
    if player:GetItems():GetItemCount(600003) < 30 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
    player:GetItems():RemoveItem(600003, 30)
player:GetPartners():AddPartner(RandTable({7105}), 1)
         ShowHint("#B领取成功，恭喜你")
    script:Rumor(string.format("#W%s#O恭喜，领取了走失的孩子，带上他一起战斗吧！#046#46", player:GetName()), false)
  end
end
    


  





AddNpcTable(Npc00287)
