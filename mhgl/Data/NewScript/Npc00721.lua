-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Npc00719.out 

Npc00719 = {npc_id = 719, name = GetNpcName(719)}
Npc00719.Talk = function(self, bProcess)
  if player:HasGuild() == false then
    NpcSay("你是什么人？哪帮派来的奸细，速速现形！")
    return 
  end
  local ManorScale = player:GetGuild():GetManorScale()
  if ManorScale == 0 then
    NpcSay("你这家伙是哪里跑进来的？你没有山庄？")
    return 
  end
  NpcAsk({"孤军奋战，不战死至最后一人，绝不投降，这需要有勇气，还得需要有一份对国家的忠心。是条汉子都该这样！", "只要还有一分力气，我就要为我的主宰拼到底。就算明知不敌，也要拼到底。"})
--  SetAnswer(1, "装备强化")
 -- SetAnswer(2, "装备鉴定")
 -- SetAnswer(3, "关于装备强化和鉴定的介绍")
  SetAnswer(4, "离开")
  WaitAnswer(4)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("mixshop", 62)
  elseif GetAnswer() == 2 then
    NpcAsk("你的装备是需要什么服务？")
    SetAnswer(1, "首次属性鉴定")
    SetAnswer(2, "重新进行属性鉴定")
    SetAnswer(3, "算了，我要离开")
    WaitAnswer(3)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      script:OpenInterface("mixshop", 60)
    elseif GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      script:OpenInterface("mixshop", 61)
    end  
  elseif GetAnswer() == 3 then 
    NpcAsk("附加的属性和强化功能只有50级以上的装备才拥有。\\r    装备的鉴定分为#R山寨、下品、中品、上品、极品、超极品#W6种，每次鉴定都会随机出现一种。首次进行鉴定只需要少量银两，再次鉴定则需要玩家持有对应的鉴定符。\\r    而关于装备强化，这个分为10个等级，每次强化需要消耗一个对应等级的强化精华，强化失败的话是会降低强化等级的噢~每个等级会降低的程度都不一样，请各位好好把握机会强化出最强装备吧！~")
	  SetAnswer(1,"离开")
	  WaitAnswer(1)
  end
end
AddNpcTable(Npc00719)

