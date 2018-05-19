-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\新建文件夹\NPC00050.out 

local l_0_0 = {}
l_0_0.npc_id = 50
l_0_0.name = GetNpcName(50)
Npc00050 = l_0_0
l_0_0 = Npc00050
l_0_0.Talk = function(l_1_0, l_1_1)
  NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片")
  SetAnswer(2, "神器防御")
  SetAnswer(3, "神器攻击")
  SetAnswer(4, "神器法术")
  SetAnswer(100, "神器回收（有用的别放在包里哦）")
  SetAnswer(15, "离开")
  WaitAnswer(15)
if GetAnswer() == 2 then
NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
  SetAnswer(1, "神器枪")
  SetAnswer(2, "神器扇")
  SetAnswer(3, "神器棒")
  SetAnswer(4, "神器爪")
  SetAnswer(5, "神器斧")
  SetAnswer(6, "神器锤")
  SetAnswer(7, "神器朝夕")
  SetAnswer(8, "神器九霄")
  SetAnswer(9, "神器擒龙")
  end
  SetAnswer(20, "下一页")
  SetAnswer(19, "离开")
  WaitAnswer(19)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402931, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402932, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402933, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402934, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402935, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 6 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402936, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 7 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402937, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 8 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402938, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 9 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402939, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 20 then
 NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
      SetAnswer(10, "神器鸣鸿")
  SetAnswer(11, "神器浮犀")
  SetAnswer(12, "神器男头")
  SetAnswer(13, "神器女头")
  SetAnswer(14, "神器男衣")
  SetAnswer(15, "神器女衣")
  SetAnswer(16, "神器腰带")
  SetAnswer(17, "神器鞋子")
  SetAnswer(18, "神器项链")
  end
   SetAnswer(19, "离开")
  WaitAnswer(19)
	if GetAnswer() == 10 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402940, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 11 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402941, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 12 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402942, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 13 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402943, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 14 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402944, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 15 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402945, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 16 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402946, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 17 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402947, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 18 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(402948, 1)
    ShowHint("神器给你了#46") 
	end
end
end
if GetAnswer() == 3 then
NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
  SetAnswer(1, "神器枪")
  SetAnswer(2, "神器扇")
  SetAnswer(3, "神器棒")
  SetAnswer(4, "神器爪")
  SetAnswer(5, "神器斧")
  SetAnswer(6, "神器锤")
  SetAnswer(7, "神器朝夕")
  SetAnswer(8, "神器九霄")
  SetAnswer(9, "神器擒龙")

  end
   SetAnswer(20, "下一页")
  SetAnswer(19, "离开")
  WaitAnswer(19)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404038, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404039, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404040, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404041, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404042, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 6 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404043, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 7 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404044, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 8 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404045, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 9 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404046, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 20 then
 NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
      SetAnswer(10, "神器鸣鸿")
  SetAnswer(11, "神器浮犀")
  SetAnswer(12, "神器男头")
  SetAnswer(13, "神器女头")
  SetAnswer(14, "神器男衣")
  SetAnswer(15, "神器女衣")
  SetAnswer(16, "神器腰带")
  SetAnswer(17, "神器鞋子")
  SetAnswer(18, "神器项链")
  end
   SetAnswer(19, "离开")
  WaitAnswer(19)
	if GetAnswer() == 10 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404047, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 11 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404048, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 12 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404049, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 13 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404050, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 14 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404051, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 15 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404052, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 16 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404053, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 17 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404054, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 18 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404055, 1)
    ShowHint("神器给你了#46") 
	end
end
end
if GetAnswer() == 4 then
NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
  SetAnswer(1, "神器枪")
  SetAnswer(2, "神器扇")
  SetAnswer(3, "神器棒")
  SetAnswer(4, "神器爪")
  SetAnswer(5, "神器斧")
  SetAnswer(6, "神器锤")
  SetAnswer(7, "神器朝夕")
  SetAnswer(8, "神器九霄")
  SetAnswer(9, "神器擒龙")
  
  end
  SetAnswer(20, "下一页")
  SetAnswer(19, "离开")
  WaitAnswer(19)
    if GetAnswer() == 1 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404056, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404057, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404058, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404059, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404060, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 6 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404061, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 7 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404062, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 8 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404063, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 9 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404064, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 20 then
 NpcAsk("欢迎来到神器兑换#G所有物品都为30碎片兑换")
 if player:GetItems():GetItemCount(600001) > 29 then
      SetAnswer(10, "神器鸣鸿")
  SetAnswer(11, "神器浮犀")
  SetAnswer(12, "神器男头")
  SetAnswer(13, "神器女头")
  SetAnswer(14, "神器男衣")
  SetAnswer(15, "神器女衣")
  SetAnswer(16, "神器腰带")
  SetAnswer(17, "神器鞋子")
  SetAnswer(18, "神器项链")
  end
   SetAnswer(19, "离开")
  WaitAnswer(19)
	if GetAnswer() == 10 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404065, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 11 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404066, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 12 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404067, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 13 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404068, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 14 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404069, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 15 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404070, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 16 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404071, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 17 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404072, 1)
    ShowHint("神器给你了#46") 
	end
	if GetAnswer() == 18 and l_1_1 then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(600001) < 30 then
      ShowHint("你还缺少30个神器碎片")
      return 
    end
    player:GetItems():RemoveItem(600001, 30)
    player:GetItems():AddItem(404073, 1)
    ShowHint("神器给你了#46") 
	end
end
end
if GetAnswer() == 100 and l_1_1 then
if player:GetItems():GetItemCount(402931) > 0 then	    
       player:GetItems():RemoveItem(402931, 1)  
       player:GetItems():AddItem(600001, 20) 
       elseif player:GetItems():GetItemCount(402932) > 0 then	    
       player:GetItems():RemoveItem(402932, 1)  
       player:GetItems():AddItem(600001, 20) 
	   elseif player:GetItems():GetItemCount(402933) > 0 then	    
       player:GetItems():RemoveItem(402933, 1)  
       player:GetItems():AddItem(600001, 20) 
	   elseif player:GetItems():GetItemCount(402934) > 0 then	    
       player:GetItems():RemoveItem(402934, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402935) > 0 then	    
       player:GetItems():RemoveItem(402935, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402936) > 0 then	    
       player:GetItems():RemoveItem(402936, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402937) > 0 then	    
       player:GetItems():RemoveItem(402937, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402938) > 0 then	    
       player:GetItems():RemoveItem(402938, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402939) > 0 then	    
       player:GetItems():RemoveItem(402939, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402940) > 0 then	    
       player:GetItems():RemoveItem(4029340, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402941) > 0 then	    
       player:GetItems():RemoveItem(402941, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402942) > 0 then	    
       player:GetItems():RemoveItem(402942, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402943) > 0 then	    
       player:GetItems():RemoveItem(402943, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402944) > 0 then	    
       player:GetItems():RemoveItem(402944, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402945) > 0 then	    
       player:GetItems():RemoveItem(402945, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402946) > 0 then	    
       player:GetItems():RemoveItem(402946, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402947) > 0 then	    
       player:GetItems():RemoveItem(402947, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(402948) > 0 then	    
       player:GetItems():RemoveItem(402948, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404038) > 0 then	    
       player:GetItems():RemoveItem(404038, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404039) > 0 then	    
       player:GetItems():RemoveItem(404039, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404040) > 0 then	    
       player:GetItems():RemoveItem(404040, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404041) > 0 then	    
       player:GetItems():RemoveItem(404041, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404042) > 0 then	    
       player:GetItems():RemoveItem(404042, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404043) > 0 then	    
       player:GetItems():RemoveItem(404043, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404044) > 0 then	    
       player:GetItems():RemoveItem(404044, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404045) > 0 then	    
       player:GetItems():RemoveItem(404045, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404046) > 0 then	    
       player:GetItems():RemoveItem(404046, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404047) > 0 then	    
       player:GetItems():RemoveItem(404047, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404048) > 0 then	    
       player:GetItems():RemoveItem(404048, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404049) > 0 then	    
       player:GetItems():RemoveItem(404049, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404050) > 0 then	    
       player:GetItems():RemoveItem(404050, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404051) > 0 then	    
       player:GetItems():RemoveItem(404051, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404052) > 0 then	    
       player:GetItems():RemoveItem(404052, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404053) > 0 then	    
       player:GetItems():RemoveItem(404053, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404054) > 0 then	    
       player:GetItems():RemoveItem(404054, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404055) > 0 then	    
       player:GetItems():RemoveItem(404055, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404056) > 0 then	    
       player:GetItems():RemoveItem(404056, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404057) > 0 then	    
       player:GetItems():RemoveItem(404057, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404058) > 0 then	    
       player:GetItems():RemoveItem(404058, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404059) > 0 then	    
       player:GetItems():RemoveItem(404059, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404060) > 0 then	    
       player:GetItems():RemoveItem(404060, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404061) > 0 then	    
       player:GetItems():RemoveItem(404061, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404062) > 0 then	    
       player:GetItems():RemoveItem(404062, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404063) > 0 then	    
       player:GetItems():RemoveItem(404063, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404064) > 0 then	    
       player:GetItems():RemoveItem(404064, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404065) > 0 then	    
       player:GetItems():RemoveItem(404065, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404066) > 0 then	    
       player:GetItems():RemoveItem(404066, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404067) > 0 then	    
       player:GetItems():RemoveItem(404067, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404068) > 0 then	    
       player:GetItems():RemoveItem(404068, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404069) > 0 then	    
       player:GetItems():RemoveItem(404069, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404070) > 0 then	    
       player:GetItems():RemoveItem(404070, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404071) > 0 then	    
       player:GetItems():RemoveItem(404071, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404072) > 0 then	    
       player:GetItems():RemoveItem(404072, 1)  
       player:GetItems():AddItem(600001, 20)
	   elseif player:GetItems():GetItemCount(404073) > 0 then	    
       player:GetItems():RemoveItem(404073, 1)  
       player:GetItems():AddItem(600001, 20)
   end 
end
end
l_0_0 = AddNpcTable
l_0_0(Npc00050)
