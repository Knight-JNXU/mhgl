--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60221 = {
}

function Item60221:MapUse(target)
  
  
  
  local i = math.random(1,10)
  ItemAsk("确定要使用礼盒吗?")
  SetAnswer(1,"使用")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if i == 1 then
      if not item:ReduceCount() then return end
      ShowMessage("#W获得超级金柳露#18")
      player:GetItems():AddItem(30001, 1)
      script:Rumor(string.format(" %s #W打开了#O金柳露礼盒#W,竟然在里面发现了一个#Y[%s]#89", player:GetCharNameLink(), GetItemName(30001)), true)
    elseif i <= 3 then
      if not item:ReduceCount() then return end
      ShowMessage("#W获得金柳露x2#97")
      player:GetItems():AddItem(30000, 2)
  --    script:Rumor(string.format(" %s #W打开了#O金柳露礼盒#W,竟然在里面发现了两个#Y[%s]#89", player:GetCharNameLink(), GetItemName(30000)), true)
    elseif i <= 10 then
      if not item:ReduceCount() then return end
      ShowMessage("#W获得金柳露x1")
      player:GetItems():AddItem(30000, 1)
   --   script:Rumor(string.format(" %s #W打开了#O金柳露礼盒#W,竟然在里面发现了一个#Y[%s]#89", player:GetCharNameLink(), GetItemName(30000)), true)
    end
  end
end


function Item60221:CanUse(user, target)
end

function Item60221:BattleUse(user, target)

end

AddItemTable(Item60221)