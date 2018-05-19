-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\新建文件夹\NPC00050.out 

local l_0_0 = {}
l_0_0.npc_id = 50
l_0_0.name = GetNpcName(50)
Npc00050 = l_0_0
l_0_0 = Npc00050
l_0_0.Talk = function(l_1_0, l_1_1)
  NpcAsk("神兽要一次进阶C66进阶后用20碎片换，稀有直接用30进阶碎片换")
  SetAnswer(2, "白泽进阶")
  SetAnswer(3, "大象进阶")
  SetAnswer(4, "海豚进阶")
  SetAnswer(5, "大鹏进阶") 
  SetAnswer(6, "赤焰兽进阶")
  SetAnswer(7, "小云云进阶")  
  SetAnswer(8, "小鹿鹿进阶")
  SetAnswer(9, "小猴猴进阶") 
  SetAnswer(10, "小泡泡进阶")
  SetAnswer(11, "小人参果进阶")
  SetAnswer(12, "小神虎进阶")
  SetAnswer(13, "小神牛进阶")
  SetAnswer(16, "小神兔进阶")
  SetAnswer(17, "小神羊进阶")
  SetAnswer(18, "下一页")
  SetAnswer(14, "离开")
  WaitAnswer(15)
if GetAnswer() == 2 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7060) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7060)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7213}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7061) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7061)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7212}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 4 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7065) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7065)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7211}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 5 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7069) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7069)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7210}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 6 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7070) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7070)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7209}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 7 and l_1_1 then
    script:SetSaying(true)
     if player:GetPartners():GetPartnerCount(7074) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7074)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7208}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 8 and l_1_1 then
    script:SetSaying(true)
     if player:GetPartners():GetPartnerCount(7078) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7078)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7207}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 9 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7079) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7079)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7206}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 10 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7084) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7084)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7205}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 11 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7087) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7087)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7204}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 12 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7090) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7090)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7203}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 13 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7093) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7093)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7202}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end 
if GetAnswer() == 16 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7095) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7095)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7201}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 17 and l_1_1 then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(7096) < 1 then
      ShowHint("你并没有这样的变异召唤兽")
      return 
    end	
    if player:GetItems():GetItemCount(600000) < 20 then
      ShowHint("你还缺少20个宠物进阶碎片")
      return 
    end
 
 
	player:GetPartners():RemovePartner(7096)
    player:GetItems():RemoveItem(600000, 20)
    
    player:GetPartners():AddPartner(RandTable({7200}), 1)
   ShowHint("#B进阶成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽，渡过层层雷劫，练就不败金刚之身，成功进阶，从此这世间又多一高手真是可喜可贺！#046#46", player:GetName()), false)
  end
if GetAnswer() == 18 then
  NpcAsk("有需要兑换的召唤兽，那说明你也是算是一个人物了！只要你能满足我的条件，本大仙可以指导你一二！嘿嘿~~~")
  SetAnswer(1,"兑换夜罗刹")
  SetAnswer(2,"兑换犀牛人")
  SetAnswer(3,"兑换真陀")
  SetAnswer(4,"兑换毗舍")
  SetAnswer(5,"兑换熊猫")
  SetAnswer(6,"兑换猫灵")
  SetAnswer(7,"兑换画魂")
  SetAnswer(8,"兑换鬼将")
  SetAnswer(9,"兑换幽莹娃娃")
  SetAnswer(10,"兑换猫灵人")
  SetAnswer(11,"兑换狂豹人")
  SetAnswer(12,"兑换巡游")
  SetAnswer(13,"兑换大力")
  SetAnswer(14,"离开")
  WaitAnswer(15)
if GetAnswer() == 1 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7214}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽夜罗刹收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 2 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7215}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽犀牛人收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 3 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7216}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽真陀护法收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 4 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7217}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽毗舍童子收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 5 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7218}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽熊猫收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 6 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7219}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽猫灵收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 7 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7220}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽画魂收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 8 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7221}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽鬼将收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 9 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7222}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽幽莹娃娃收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 10 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7223}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽猫灵人收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 11 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7224}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽狂豹人收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 12 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7225}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽巡游收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
if GetAnswer() == 13 and l_1_1 then
  if player:GetItems():GetItemCount(600000) < 30 then
      ShowHint("你还缺少30个宠物进阶碎片")
      return
       end  
     player:GetItems():RemoveItem(600000, 30)
    player:GetPartners():AddPartner(RandTable({7226}), 1)
	 ShowHint("#兑换成功，恭喜你")
    script:Rumor(string.format("#W%s#O终于将召唤兽大力收入怀里，准备上前杀敌。#046#46", player:GetName()), false)
end
end
end

l_0_0 = AddNpcTable
l_0_0(Npc00050)
