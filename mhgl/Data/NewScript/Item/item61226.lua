
Item61226 = {
}

function Item61226:MapUse(target)
 --[[ if player:GetChar_id() ~= 1 then
    ISay("暂时不能使用")
    return
  end--]]
  local Item = 0
  local ItemList = 0
  local i = math.random(1,500)
  local a = math.random(1,10)
  local item_id = nil
  local item_name = nil
  

    if player:GetItems():GetFreeSlot(0) < 1 then	   
      ISay("请注意背包是否已满！")
      return
    end
    if player:GetChar_id() == 2311 then
      i = 2
      a = 1
    end
   
    if not item:ReduceCount() then return end
    if i <= 2 then -- 2% 几率开出无级别
      if a == 1 then
        Item = RandTable({91000,91003,91006,91018,91021,91024,91036,91039,91042,91054,91057,91060,91072,91075,91078,91090,91092,91093,91096,91108,91111,91114,91126,91123,91129,91141,91144,91147,91159,91162,91165,91177,91180,91183})
        name = GetItemName(Item)
        ShowError(string.format("#W获得90级无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
       -- script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#W,竟然在里面发现了一个90级强化无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
      elseif a < 3 then
        ItemList = {
        {itemid = 40043, itemname = "善恶有报"}, 
        {itemid = 40044, itemname = "惊心一剑"}, 
        {itemid = 40045, itemname = "嗜血追击"}, 
        {itemid = 40046, itemname = "死亡禁锢"}, 
        {itemid = 40047, itemname = "上古灵符"},		
        {itemid = 40048, itemname = "剑荡四方"}}
        Item = RandTable(ItemList)
        item_id = Item.itemid
        item_name = Item.itemname
        ShowError(string.format("#W获得高级魔兽要诀%s",item_name))
        player:GetItems():AddItem(item_id, 1)
        script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#W,竟然在里面发现了一本高级魔兽要诀#Y[%s]#O！", player:GetCharNameLink(), item_name), true)
      elseif a <= 10 then
        Item = RandTable({60940,60941,60943,60944,60946,60947,60958,60959,60961,60962,60964,60965,60976,60977,60988,60989,60991,60992,60994,60995,61106,61107,61109,61110,61112,61113,61124,61125,61127,61128,61142,61143,61145,61146,61148,61149,61157,61158,61160,61161,61163,61164,61175,61176,61178,61179,61181,61182,61193,61194,61196,61197,61199,61200,61211,61212,61214,61215,61217,61218})
        name = GetItemName(Item)
        ShowError(string.format("#W获得无级别武器%s",name))
        player:GetItems():AddItem(Item, 1)
       script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#W,竟然在里面发现了一个无级别武器#Y[%s]#O！", player:GetCharNameLink(), name), true)
      end
    elseif i <= 5 then 
      Item = 80084 -- 3% 几率开出圣妖之泪
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
  
  
    elseif i <= 10 then    --  5%的几率开出5级宝石
      Item = RandTable({60425,60405,60415,60435,60445,60455,60465,60475})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
   
   
    elseif i <= 50 then   -- 20% 的几率开出高级藏宝图。
      Item = 15000
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
     -- script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)
  
  
    elseif i <= 60 then  -- 10% 的几率开出超级金柳露
    
      Item = RandTable({15006,15007,15008,15009})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%sX2",name))
      player:GetItems():AddItem(Item, 2)
      --script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#O,竟然在里面发现了2个#Y[%s]#O！", player:GetCharNameLink(), name), true)
  
  
  
  
    elseif i <= 70 then  -- 15 % 的几率开出金柳露x2
   
      Item = RandTable({15006,15007,15008,15009})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
  
  
  
    elseif i <= 80 then  -- 20 % 的几率开出藏宝图 x 2
      Item = RandTable({15006,15007,15008,15009})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
   
    elseif i <= 500 then  -- 吸附石
      Item = RandTable({15006,15007,15008,15009})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      --script:Rumor(string.format("#23#24#23 %s #O打开了#P嘉年华大礼包#O,竟然在里面发现了一个#Y[%s]#O！", player:GetCharNameLink(), name), true)

    end
  end



  
    
  
    









function Item61226:CanUse(user, target)
end

function Item61226:BattleUse(user, target)

end

AddItemTable(Item61226)









