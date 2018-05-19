Npc00350 = {							
	npc_id = 350,						
	name = GetNpcName(350),				
										
}

function Npc00350:Talk(bProcess) 
  NpcAsk("是否万能兑换任何东西")
  SetAnswer(1,"加攻击灵饰，四相石各30个兑换")
  SetAnswer(2,"加灵力灵饰，四相石各30个兑换")
  SetAnswer(3,"加生命灵饰，四相石各30个兑换")
  SetAnswer(4,"加防御灵饰，四相石各30个兑换")
 -- SetAnswer(5,"无瑕熔炼石（神秘石、蓝宝石）4相石各20个130铁1个")
  SetAnswer(6,"加速度灵饰")
  SetAnswer(7,"100W，四相石各15个兑换")
  SetAnswer(9,"至尊VIP兑换，VIP兑换卡1张及神秘物品1个")
  SetAnswer(8,"VIP升级，神秘物品1个")
  --SetAnswer(10,"法宝升级内丹，四相石各10个")
  --SetAnswer(11,"金丹10E经验，四相石各5个")
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
    if player:GetItems():GetItemCount(15007) < 20 and GetItemCount(15006) < 20 and GetItemCount(15708) < 20 and GetItemCount(15709) < 20 then
	    return
	else
    player:GetItems():AddItem(51402, 1)
    ShowHint("无暇熔炼石给你了#46")
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
    if player:GetItems():GetItemCount(15007) < 15 and GetItemCount(15006) < 15 and GetItemCount(15708) < 15 and GetItemCount(15709) < 15 then
	    return
	else
    player:GetItems():RemoveItem(15007, 15)
	player:GetItems():RemoveItem(15008, 15)
	player:GetItems():RemoveItem(15009, 15)
	player:GetItems():RemoveItem(15006, 15)
    player:GetItems():AddItem(80057,1)
    ShowHint("100W给你了#46") 
	end
 		elseif GetAnswer() == 8 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(51402) < 1 then
		 NpcSay("你不是VIP")
		 return
		 end
		if player:GetItems():GetItemCount(555560) < 1 then
		NpcSay("你没有神秘物品哦")
		return
		else
		player:GetItems():RemoveItem(51402, 1)
		player:GetItems():RemoveItem(555560, 1)
         player:GetItems():AddItem(51403, 1)
		 ShowHint("至尊VIP给你了哦#46")
		 end
		elseif GetAnswer() == 9 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(555560) < 1 then
		 NpcSay("你没有神秘物品哦")
		 return
		 end
		  if player:GetItems():GetItemCount(555555) < 1 then
		 NpcSay("你没有VIP兑换卡哦")
		 return
		 else
		 player:GetItems():RemoveItem(555560, 1)
		player:GetItems():RemoveItem(555555, 1)
         player:GetItems():AddItem(51403, 1)
		 ShowHint("至尊VIP给你了哦#46")
		 end
  elseif GetAnswer() == 10 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 9 and GetItemCount(15006) < 9 and GetItemCount(15708) < 9 and GetItemCount(15709) < 9  then
	    return
	else
    player:GetItems():RemoveItem(15007, 10)
	player:GetItems():RemoveItem(15008, 10)
	player:GetItems():RemoveItem(15009, 10)
	player:GetItems():RemoveItem(15006, 10)
    player:GetItems():AddItem(60234, 1)
    ShowHint("法宝升级丹给你了#46") 
	end
elseif GetAnswer() == 11 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15007) < 5 and GetItemCount(15006) < 5 and GetItemCount(15708) < 5 and GetItemCount(15709) < 5 then
	    return
	else
     player:GetItems():RemoveItem(15007, 5)
	player:GetItems():RemoveItem(15008, 5)
	player:GetItems():RemoveItem(15009, 5)
	player:GetItems():RemoveItem(15006, 5)
    player:GetItems():AddItem(61041, 1)
    ShowHint("金丹给你了#46") 
  end
end	
end











AddNpcTable(Npc00350)