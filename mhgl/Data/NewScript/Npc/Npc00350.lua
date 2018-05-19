Npc00350 = {							
	npc_id = 350,						
	name = GetNpcName(350),				
										
}

function Npc00350:Talk(bProcess) 
  NpcAsk("是否万能兑换任何东西")
  --SetAnswer(1,"加攻击灵饰30个四相")
  --SetAnswer(2,"加灵力灵饰30个四相")
  --SetAnswer(3,"加生命灵饰30个四相")
  --SetAnswer(4,"加防御灵饰30个四相")
  --SetAnswer(6,"加速度灵饰30个四相")
  --SetAnswer(7,"900W，四相石各150个兑换")
  SetAnswer(5,"回收青龙100个100W")
  SetAnswer(9,"回收朱雀100个100W")
  --SetAnswer(8,"神秘物品2个")
  SetAnswer(10,"回收玄武100个100W")
  SetAnswer(11,"回收白虎100个100W")
  --SetAnswer(13,"回收C66200个100W")
  SetAnswer(12,"我才不和你换呢")
  WaitAnswer(12)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 30 and GetItemCount(15006) < 30 and GetItemCount(15708) < 30 and GetItemCount(15709) < 30 then
	    return
	else
   player:GetItems():RemoveItem(15007, 30)
	player:GetItems():RemoveItem(15008, 30)
	player:GetItems():RemoveItem(15009, 30)
	player:GetItems():RemoveItem(15006, 30)
    player:GetItems():AddItem(80677, 1)
    ShowHint("灵饰给你了#46") 
	end
  elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
     if player:GetItems():GetItemCount(15007) < 30 and GetItemCount(15006) < 30 and GetItemCount(15708) < 30 and GetItemCount(15709) < 30 then
	    return
	else
    player:GetItems():RemoveItem(15007, 30)
	player:GetItems():RemoveItem(15008, 30)
	player:GetItems():RemoveItem(15009, 30)
	player:GetItems():RemoveItem(15006, 30)
    player:GetItems():AddItem(80681, 1)
    ShowHint("灵饰给你了#46") 
	end
 elseif GetAnswer() == 3 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 30 and GetItemCount(15006) < 30 and GetItemCount(15708) < 30 and GetItemCount(15709) < 30 then
	    return
	else
    player:GetItems():RemoveItem(15007, 30)
	player:GetItems():RemoveItem(15008, 30)
	player:GetItems():RemoveItem(15009, 30)
	player:GetItems():RemoveItem(15006, 30)
    player:GetItems():AddItem(80679, 1)
    ShowHint("灵饰给你了#46") 
	end
  elseif GetAnswer() == 4 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 30 and GetItemCount(15006) < 30 and GetItemCount(15708) < 30 and GetItemCount(15709) < 30 then
	    return
	else
    player:GetItems():RemoveItem(15007, 30)
	player:GetItems():RemoveItem(15008, 30)
	player:GetItems():RemoveItem(15009, 30)
	player:GetItems():RemoveItem(15006, 30)
    player:GetItems():AddItem(80678, 1)
    ShowHint("灵饰给你了#46") 
	end
 elseif GetAnswer() == 5 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15008) < 100 then
	    return
	else
	player:GetItems():RemoveItem(15008, 100)
	player:ChangeMoney(1000000)
    ShowHint("银子给你了")
	end
  elseif GetAnswer() == 6 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 30 and GetItemCount(15006) < 30 and GetItemCount(15708) < 30 and GetItemCount(15709) < 30 then
	    return
	else
    player:GetItems():RemoveItem(15007, 30)
	player:GetItems():RemoveItem(15008, 30)
	player:GetItems():RemoveItem(15009, 30)
	player:GetItems():RemoveItem(15006, 30)
    player:GetItems():AddItem(80682, 1)
    ShowHint("灵饰给你了#46") 
	end
  elseif GetAnswer() == 7 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 150 and GetItemCount(15006) < 150 and GetItemCount(15708) < 150 and GetItemCount(15709) < 150 then
	    return
	else
    player:GetItems():RemoveItem(15007, 150)
	player:GetItems():RemoveItem(15008, 150)
	player:GetItems():RemoveItem(15009, 150)
	player:GetItems():RemoveItem(15006, 150)
    player:GetItems():AddItem(80059,3)
    ShowHint("900W给你了#46") 
	end
 		elseif GetAnswer() == 8 and bProcess then
    script:SetSaying(true)
		if player:GetItems():GetItemCount(555561) < 2 then
		NpcSay("你没有神秘物品哦")
		return
		else
		player:GetItems():RemoveItem(555561, 2)
         player:GetItems():AddItem(401680, 1)
		 ShowHint("至尊VIP给你了哦#46")
		 end
		elseif GetAnswer() == 9 and bProcess then
    script:SetSaying(true)
   if player:GetItems():GetItemCount(15007) < 100 then
	    return
	else
	player:GetItems():RemoveItem(15007, 100)
	player:ChangeMoney(1000000)
    ShowHint("银子给你了")
	end
  elseif GetAnswer() == 10 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15009) < 100 then
	    return
	else
	player:GetItems():RemoveItem(15009, 100)
	player:ChangeMoney(1000000)
    ShowHint("银子给你了")
	end
elseif GetAnswer() == 11 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 100 then
	    return
	else
	player:GetItems():RemoveItem(15006, 100)
	player:ChangeMoney(1000000)
    ShowHint("银子给你了")
	end
	elseif GetAnswer() == 13 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(30001) < 200 then
	    return
	else
	player:GetItems():RemoveItem(30001, 200)
	player:GetItems():AddItem(80057,1)
    ShowHint("100W银子给你了")
	end
end	
end











AddNpcTable(Npc00350)