--author: hula
--金柳露指定同伴后右击使用：只能对携带要求不大于35级的紫人形同伴使用，等级归0，各项能力重新生成
--北方修改  2009-0-23
Item80086 = {
}

function Item80086:MapUse(target)
  IAsk("你确定要使用二级药品大礼包吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if player:GetItems():GetFreeSlot(0) < 1 then	   
      ISay("请注意背包是否已满！")
      return
    end
    if not item:ReduceCount() then return end
    Item = RandTable({10003,10004,10007,10041,10034,10031})
    name = GetItemName(Item)
    ShowError(string.format("#W获得%s",name))
    player:GetItems():AddItem(Item, 10)
  end
end





function Item80086:CanUse(user, target)
end

function Item80086:BattleUse(user, target)

end

AddItemTable(Item80086)