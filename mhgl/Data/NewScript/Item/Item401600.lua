-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 300)
  if Freeslot < 1 then
    ShowHint("包裹空間不足，請留1個位置")
    ShowError("#W包裹空間不足，請留1個位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
     local FirstP = math.random(1, 300)
    if FirstP <= 5 then
	itemid = RandTable({600000,600001})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
     elseif a <= 7 then
     itemid = RandTable({91000, 91001, 91002, 91003, 91004, 91005, 91006, 91007, 91008, 91009, 91010, 91011, 91012, 91013, 91014, 91015, 91016, 91017, 91018, 91019, 91020, 91021, 91022, 91023, 91024, 91025, 91026, 91027, 91028, 91029, 91030, 91031, 91032, 91033, 91034, 91035, 91036, 91037, 91038, 91039, 91040, 91041})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
  elseif a <= 10 then
    itemid = RandTable({444444})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
   elseif a <= 14 then
    itemid = RandTable({91086, 91087, 91088, 91089, 91090, 91091, 91092, 91093, 91094, 91095, 91096, 91097, 91098, 91099, 91100, 91101, 91102, 91103, 91104, 91105, 91106, 91107, 91108, 91109, 91110, 91111, 91112, 91113, 91114, 91115, 91116, 91117, 91118, 91119, 91120, 91121, 91122, 91123, 91124, 91125, 91126, 91127, 91128, 91129, 91130, 91131})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
  elseif a <= 19 then
    itemid = RandTable({91132, 91133, 91134, 91135, 91136, 91137, 91138, 91139, 91140, 91141, 91142, 91143, 91144, 91145, 91146, 91147, 91148, 91149, 91150, 91151, 91152, 91153, 91154, 91155, 91156, 91157, 91158, 91159, 91160, 91161, 91162, 91163, 91164, 91165, 91166, 91167, 91168, 91169, 91170, 91171, 91172, 91173, 91174, 91175, 91176, 91177, 91178, 91179, 91180})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开#R土豪礼包#O，意外地發現裡面有1個#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
  elseif a <= 24 then
    itemid = RandTable({91181, 91182, 91183, 91184, 91185, 91186, 91187, 91188, 91189, 91190, 91191})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 30 then
    itemid = RandTable({60811, 60812, 60821, 60822, 60813, 60823, 60831, 60832, 60833, 60841, 60842, 60843, 60851, 60852, 60853, 60861, 60862, 60863, 60871, 60872, 60873, 60801, 60802, 60803})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 50 then
    itemid = RandTable({60811, 60812, 60821, 60822, 60831, 60832, 60841, 60842, 60851, 60852, 60861, 60862, 60871, 60872, 60801, 60802})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 70 then
    itemid = RandTable({60811, 60821, 60831, 60841, 60851, 60861, 60871, 60801})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 100 then
    itemid = RandTable({20754, 20755, 20756, 20757, 20758, 20759, 20760, 401675})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
     elseif a <= 140 then
    itemid = RandTable({401675})
    player:GetItems():AddItem(itemid, math.random(3, 5))
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出N个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)  
     elseif a <= 250 then
    itemid = RandTable({402850})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R土豪礼包#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)  
		elseif a <= 300 then  -- 22 % 的几率开出银子35万
      local money = math.random(5000000,15000000)
      ShowError(string.format("#W获得银子%s",money))
      if money >= 3000000 then
        script:Rumor(string.format("#23#24#23 %s #O打开了#P土豪礼包#O,竟然在里面发现了#Y[%s]#O两银子！", player:GetCharNameLink(), money), true)
      end
      player:ChangeMoney(money) 
  end
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
