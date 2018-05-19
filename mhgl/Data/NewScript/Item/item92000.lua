
Item92000 = {
}

function Item92000:MapUse(target)
 --[[ if player:GetChar_id() ~= 1 then
    ISay("暂时不能使用")
    return
  end--]]
  local Item = 0
  local ItemList = 0
  local i = math.random(1,300)
  local a = math.random(1,11)
  local item_id = nil
  local item_name = nil
  local id = player:GetChar_id()
  local PartnerID = 0
  ItemAsk("尊敬的至尊用户您好,这是专为土豪打造的超级礼包！\r#P[开礼包小诀窍:开礼包的间隔时间尽量不要太短]")
  SetAnswer(1,"打开")
  SetAnswer(2,"算了")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if player:GetItems():GetFreeSlot(0) < 1 then	   
      ISay("请注意背包是否已满！")
      return
    end
    if player:GetChar_id() == 1 then
	   -- if math.random(2,2) == 2 then
	      -- i = 50
		  -- a = 11
	   -- end
    end
   
    if not item:ReduceCount() then return end
    if i <= 50 then -- 2% 150无级别
      if a == 1 then
        Item = RandTable({90000,90001,90002,90003,90004,90005,90006,90007,90008,90009,90010})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个150级无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
      elseif a == 2 then
        ItemList = {
        {itemid = 40043, itemname = "善恶有报"}, 
        {itemid = 40044, itemname = "惊心一剑"}, 
        {itemid = 40045, itemname = "嗜血追击"}, 
        {itemid = 40046, itemname = "死亡禁锢"}, 
        {itemid = 40047, itemname = "上古灵符"}, 
        {itemid = 40048, itemname = "剑荡四方"},
		{itemid = 40049, itemname = "力劈华山"},
		{itemid = 60199, itemname = "须弥真言"},}
        Item = RandTable(ItemList)
        item_id = Item.itemid
        item_name = Item.itemname
        ShowError(string.format("#W获得高级魔兽要诀%s",item_name))
        player:GetItems():AddItem(item_id, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一本高级魔兽要诀#Y[%s]#O！", player:GetCharNameLink(), item_name), true)
      elseif a == 3 then -- 140无级别
        Item = RandTable({60951,60954,60957,60969,60975,60981,60984,60987,60999,61102,61105,61117,61120,61123,61135,61138,61141,61153,61156,61168,61171,61174,61186,61189,61192,61204,61207,61210,61222,61225,80029,80032})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个140无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
	  elseif a == 4 then -- 130无级别
        Item = RandTable({60950,60953,60956,60968,60974,60980,60983,60986,60998,61101,61104,61116,61119,61122,61134,61137,61140,61152,61155,61167,61170,61173,61185,61188,61191,61203,61206,61209,61221,61224,80028,80031})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个130无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
	  elseif a == 5 then -- 130~150无级别装备
	    Item = RandTable({61231,61232,61233,61238,61239,61240,61245,61246,61247,61252,61253,61254,61259,61260,61261,61266,61267,61268,61273,61274,61275})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别%s",name))
        player:GetItems():AddItem(Item, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个无级别#Y[%s]#O！", player:GetCharNameLink(), name), true)
	  elseif a <= 10 then -- 120无级别
        Item = RandTable({60949,60952,60955,60967,60970,60973,60979,60982,60985,60997,61100,61103,61115,61118,61121,61133,61136,61139,61151,61154,61166,61169,61172,61184,61187,61190,61202,61205,61208,61220,61223,80027,80030})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个120无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
	  elseif a == 11 then -- 限量妖兽
	    PartnerID = RandTable({564,565,566})
		name = GetMobName(PartnerID)
		ShowError(string.format("#W获得妖兽：%s",name))
		player:GetPartners():AddPartner(PartnerID)
		script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#W,竟然在里面发现了一个#A妖兽：#Y[%s]#O！", player:GetCharNameLink(), name), true)
      end
    elseif i <= 90 then 
      Item = RandTable({80091,93000,92001,92002,92003,92004,92005}) -- 3% 几率开出圣妖之泪
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
  
  
    elseif i <= 130 then    --  5%的几率开出10级宝石
      Item = RandTable({60430,60410,60420,60440,60450,60460,60470,60480})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
	  
    elseif i <= 160 then    --  5%130~150书
      Item = RandTable({20082,20083,20084,20098,20099,20100,20114,20115,20116,20130,20131,20132,20146,20147,20148,20162,20163,20164,20178,20179,20180,20194,20195,20196,20210,20211,20212,20226,20227,20228,20242,20243,20244,60038,60039,60040,60054,60055,60056,60071,60072,60073,60087,60088,60089,60103,60104,60105,60119,60120,60121,60313,60314,60315})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
   
    elseif i <= 210 then   -- 20% 130~150铁
      Item = RandTable({20258,20259,20260})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
  
    elseif i <= 270 then  -- 10% 的几率开出元宝
	  local Gold = math.random(100000,200000)
      local file = io.open("./LuaDat/PayConfig.dat",'a')
	  file:write(string.format("%s %d\r\n",id,Gold))
	  file:close()
	  ShowError(string.format("\#W获得元宝#P%d#W点，商城刷新获得",Gold))
	  script:Rumor(string.format("#23#24#23 %s #O打开了#P豪气福袋#O,竟然在里面发现了#Y[%d]#O元宝！", player:GetCharNameLink(), Gold), true)
    elseif i <= 300 then -- 23% 的几率#W获得5万储备金,10万经验
     
      local money = math.random(200000,300000)
	  local exp = math.random(500000,2000000)
      ShowError(string.format("#W获得银子%d 经验%d",money,exp))
      player:ChangeMoney(money)
	  player:ChangeExp(exp)
    end
  end
end


  
    
  
    









function Item92000:CanUse(user, target)
end

function Item92000:BattleUse(user, target)

end

AddItemTable(Item92000)









