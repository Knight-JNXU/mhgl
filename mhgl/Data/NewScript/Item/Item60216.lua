--author: apollo
--【功效】恢复愤怒值=品质*1，附加疯狂状态3~4回合
Item60216 = {
}

function Item60216:MapUse(target)
  
  local A = player:GetQuests():GetFlag(60216)
  local B = player:GetQuests():GetFlag(60217)
  IAsk("欢迎来到新起点,请领取无级别前先领取金龟壳。")
  if A == 0 then
    SetAnswer(1,"先领：领取金龟壳,10E储备,120无级别,仙灵店铺卷")
  end
  if B == 0 then
    SetAnswer(2,"再领：无级别武器")
  end
  SetAnswer(3,"离开")
  WaitAnswer(3)
  if GetAnswer() == 1 then
      player:GetItems():AddItem(50000, 1)
      player:GetItems():AddItem(91237, 1)	 
      player:GetItems():AddItem(91230, 1)
      player:GetItems():AddItem(91223, 1)
      player:GetItems():AddItem(91216, 1)
	  player:GetItems():AddItem(91209, 1)
	  player:GetItems():AddItem(91195, 1)
	  player:GetItems():AddItem(91202, 1)
	  player:GetItems():AddItem(80785, 1)   
	  player:ChangeSMoney(999999999)
	  ShowHint("获得10亿储备金")	  
	  ShowHint("获得金龟壳X1")	  
	  player:GetQuests():SetFlag(60216, 1)
	elseif GetAnswer() == 2 then
	  IAsk("请选择要获得的无级别武器类型。")
	  SetAnswer(1,"枪")
	  SetAnswer(2,"扇子")
	  SetAnswer(3,"魔棒")
	  SetAnswer(4,"爪刺")
	  SetAnswer(5,"斧头")
	  SetAnswer(6,"锤子")
	  SetAnswer(7,"双环")
	  SetAnswer(8,"剑")
	  SetAnswer(9,"刀")
	  SetAnswer(10,"双剑")
	  SetAnswer(11,"飘带")
	  SetAnswer(12,"离开")
	  WaitAnswer(12)
	  if GetAnswer() == 1 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62000,62001,62003})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 2 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62004,62005,62006})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 3 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62007,62008,62009})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 4 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62010,62011,62012})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 5 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62013,62014,62015})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 6 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62016,62017,62018})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 7 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62019,62020,62032})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 8 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62024,62025,62026})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 9 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62027,62028,62029})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 10 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62030,62031,62033})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    elseif GetAnswer() == 11 then
	    if not item:ReduceCount() then return end
      Item = RandTable({62021,62022,62023})
      name = GetItemName(Item)
      ShowError(string.format("#W获得%s",name))
      player:GetItems():AddItem(Item, 1)
      player:GetQuests():SetFlag(60217, 1)
      player:GetItems():AddItem(20619, 1)
    end
  end
end

function Item60216:CanUse(user, target)
end

function Item60216:BattleUse(user, target)
end

AddItemTable(Item60216)