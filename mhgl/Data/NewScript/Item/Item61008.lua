-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Item61008.out 

Item61008 = {}
Item61008.MapUse = function(self, target)
  ItemAsk("欢迎使用#PKJ#W传送系统,请问您需要去那儿？")
  SetAnswer(1, "建邺城")
  SetAnswer(2, "东海湾")
  SetAnswer(3, "东海海底")
  SetAnswer(4, "沉船")
  SetAnswer(5, "沉船内室")
  SetAnswer(6, "江南野外")
  SetAnswer(7, "傲来国")
  SetAnswer(8, "花果山")
  SetAnswer(9, "东海岩洞")
  SetAnswer(10, "女儿村")
  SetAnswer(11, "北俱芦洲")
  SetAnswer(12, "长寿村郊外")
  SetAnswer(13, "天宫")
  SetAnswer(14, "下一页")
  SetAnswer(15, "离开")
  WaitAnswer(15)
  if GetAnswer() == 1 then
    player:JumpMap(1,12,44)--建邺城
  elseif GetAnswer() == 2 then
    player:JumpMap(2,47,237)--东海湾
  elseif GetAnswer() == 3 then
    player:JumpMap(3,36,101)--东海海底
  elseif GetAnswer() == 4 then
    player:JumpMap(4,26,97)--沉船
  elseif GetAnswer() == 5 then
    player:JumpMap(5,8,43)--沉船内室
  elseif GetAnswer() == 6 then
    player:JumpMap(6,44,175)--江南野外
  elseif GetAnswer() == 7 then
    player:JumpMap(7,74,144)--傲来国
  elseif GetAnswer() == 8 then
    player:JumpMap(8,30,140)--花果山
  elseif GetAnswer() == 9 then
    player:JumpMap(9,13,148)--东海岩洞
  elseif GetAnswer() == 10 then
    player:JumpMap(10,41,201)--女儿村
  elseif GetAnswer() == 11 then
    player:JumpMap(11,71,229)--北俱芦洲
  elseif GetAnswer() == 12 then
    player:JumpMap(12,83,223)--长寿村郊外
  elseif GetAnswer() == 13 then
    player:JumpMap(13,51,188)--天宫
  elseif GetAnswer() == 14 then
    ItemAsk("欢迎使用#PKJ#W传送系统,请问您需要去那儿？")
    SetAnswer(1, "大唐境外")
    SetAnswer(2, "五庄观")
    SetAnswer(3, "盘丝岭")
    SetAnswer(4, "狮驼岭")
    SetAnswer(5, "魔王寨")
    SetAnswer(6, "大唐国境")
    SetAnswer(7, "地府")
    SetAnswer(8, "龙宫")
    SetAnswer(9, "海底迷宫一层")
    SetAnswer(10, "海底迷宫二层")
    SetAnswer(11, "海底迷宫三层")
    SetAnswer(12, "海底迷宫四层")
    SetAnswer(13, "普陀山")
    SetAnswer(14, "下一页")
    SetAnswer(15, "离开")
    WaitAnswer(15)
    if GetAnswer() == 1 then
      player:JumpMap(14,238,245)--大唐境外
    elseif GetAnswer() == 2 then
      player:JumpMap(15,31,105)--五庄观
    elseif GetAnswer() == 3 then
      player:JumpMap(16,114,62)--盘丝岭
    elseif GetAnswer() == 4 then
      player:JumpMap(17,68,37)--狮驼岭
    elseif GetAnswer() == 5 then
      player:JumpMap(18,53,56)--魔王寨
    elseif GetAnswer() == 6 then
      player:JumpMap(19,32,670)--大唐国境
    elseif GetAnswer() == 7 then
      player:JumpMap(20,28,166)--地府
    elseif GetAnswer() == 8 then
      player:JumpMap(21,124,226)--龙宫
    elseif GetAnswer() == 9 then
      player:JumpMap(22,18,44)--海底迷宫一层
    elseif GetAnswer() == 10 then
      player:JumpMap(23,19,30)--海底迷宫二层
    elseif GetAnswer() == 11 then
      player:JumpMap(24,27,37)--海底迷宫三层
    elseif GetAnswer() == 12 then
      player:JumpMap(25,18,33)--海底迷宫四层
    elseif GetAnswer() == 13 then
      player:JumpMap(26,51,68)--普陀山
    elseif GetAnswer() == 14 then
      ItemAsk("欢迎使用#PKJ#W传送系统,请问您需要去那儿？")
      SetAnswer(1, "大唐官府")
      SetAnswer(2, "化生寺")
      SetAnswer(3, "方寸山")
      SetAnswer(4, "大雁塔一层")
      SetAnswer(5, "大雁塔二层")
      SetAnswer(6, "大雁塔三层")
      SetAnswer(7, "大雁塔四层")
      SetAnswer(8, "长安城")
      SetAnswer(15, "离开")
      WaitAnswer(15)
      if GetAnswer() == 1 then
        player:JumpMap(27,49,145)--大唐官府
      elseif GetAnswer() == 2 then
        player:JumpMap(28,29,161)--化生寺
      elseif GetAnswer() == 3 then
        player:JumpMap(29,74,193)--方寸山
      elseif GetAnswer() == 4 then
        player:JumpMap(30,36,101)--大雁塔一层
      elseif GetAnswer() == 5 then
        player:JumpMap(31,52,52)--大雁塔二层
      elseif GetAnswer() == 6 then
        player:JumpMap(32,38,101)--大雁塔三层
      elseif GetAnswer() == 7 then
        player:JumpMap(33,74,97)--大雁塔四层
      elseif GetAnswer() == 8 then
        player:JumpMap(34,265,544)--长安城
      end
    end
  end
end
      
      
      
      
      
      
      
      
Item61008.CanUse = function(self, user, target)
end

Item61008.BattleUse = function(self, user, target)
end

AddItemTable(Item61008)

