
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00698 = {							-- 孙小红
	npc_id = 698,						-- NPC ID
	name = GetNpcName(698),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00698:Talk(bProcess) 
  local i = math.random(5,10)
  NpcAsk("客观你好！我是伟大的打铁界新秀--小麦,打铁的功夫可是一流啊！可以为你修理50级以下(包括50级)的装备！\r修理高级装备时我经常砸到手……所以修理高级装备还是请到帮派或者找高手帮忙吧！\r注意:修理装备有一定的几率会失败")
  SetAnswer(1,"我要合成60级百炼精铁")
  SetAnswer(2,"我要合成70级百炼精铁")
  SetAnswer(3,"我要合成80级百炼精铁")
  SetAnswer(4,"我要合成90级百炼精铁")
  SetAnswer(6,"我要合成100级百炼精铁") 
  SetAnswer(7,"我要合成110级百炼精铁")
  SetAnswer(8,"我要合成120级百炼精铁")
  SetAnswer(9,"我要合成130级百炼精铁")
  SetAnswer(10,"我要合成140级百炼精铁")
  SetAnswer(11,"我要合成150级百炼精铁")
  SetAnswer(5,"我要合成强化百炼精铁") 
  SetAnswer(15,"打铁匠小麦,再见")
  WaitAnswer(15)
  if GetAnswer() == 1 then
    NpcAsk("合成60级精铁需要#Y两个#P50级精铁#W,和6万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 60000 then
        NpcSay("合成需要银两6万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20250) < 2 then   --50级精铁
		    NpcSay("合成60级精铁需要两个50级精铁才可以进行合成！")
		    return
		  end
		  if i < 2 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-60000)
		    player:GetItems():RemoveItem(20250, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y60级#W百铁精炼#24")
		    player:ChangeMoney(-60000)
		    player:GetItems():RemoveItem(20250, 2)
		    player:GetItems():AddItem(20251,1)
		  end
		end
  elseif GetAnswer() == 2 then
    NpcAsk("合成70级精铁需要#Y两个#P60级精铁#W,和7万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 70000 then
        NpcSay("合成需要银两7万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20251) < 2 then   --50级精铁
		    NpcSay("合成70级精铁需要两个60级精铁才可以进行合成！")
		    return
		  end
		  if i < 3 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-70000)
		    player:GetItems():RemoveItem(20251, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y70级#W百铁精炼#24")
		    player:ChangeMoney(-70000)
		    player:GetItems():RemoveItem(20251, 2)
		    player:GetItems():AddItem(20252,1)
		  end
		end
  elseif GetAnswer() == 3 then
    NpcAsk("合成80级精铁需要#Y两个#P70级精铁#W,和8万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 80000 then
        NpcSay("合成需要银两8万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20252) < 2 then   --50级精铁
		    NpcSay("合成80级精铁需要两个70级精铁才可以进行合成！")
		    return
		  end
		  if i < 4 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-80000)
		    player:GetItems():RemoveItem(20252, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y80级#W百铁精炼#24")
		    player:ChangeMoney(-80000)
		    player:GetItems():RemoveItem(20252, 2)
		    player:GetItems():AddItem(20253,1)
		  end
		end
  elseif GetAnswer() == 4 then
    NpcAsk("合成90级精铁需要#Y两个#P80级精铁#W,和9万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20253) < 2 then   --50级精铁
		    NpcSay("合成90级精铁需要两个80级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20253, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y90级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20253, 2)
		    player:GetItems():AddItem(20254,1)
		  end
		end
  elseif GetAnswer() == 6 then
    NpcAsk("合成100级精铁需要#Y3个#P90级精铁#W,和20万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 200000 then
        NpcSay("合成需要银两20万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20254) < 3 then   --50级精铁
		    NpcSay("合成100级精铁需要3个90级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-200000)
		    player:GetItems():RemoveItem(20254, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y100级#W百铁精炼#24")
		    player:ChangeMoney(-200000)
		    player:GetItems():RemoveItem(20254, 3)
		    player:GetItems():AddItem(20255,1)
		  end
		end	
  elseif GetAnswer() == 7 then
    NpcAsk("合成110级精铁需要#Y3个#P100级精铁#W,和50万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 500000 then
        NpcSay("合成需要银两50万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20255) < 3 then   --50级精铁
		    NpcSay("合成100级精铁需要3个100级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-500000)
		    player:GetItems():RemoveItem(20255, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y110级#W百铁精炼#24")
		    player:ChangeMoney(-500000)
		    player:GetItems():RemoveItem(20255, 3)
		    player:GetItems():AddItem(20256,1)
		  end
		  end
		  elseif GetAnswer() == 8 then
    NpcAsk("合成120级精铁需要#Y3个#P110级精铁#W,和10万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 100000 then
        NpcSay("合成需要银两50万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20256) < 3 then   --50级精铁
		    NpcSay("合成120级精铁需要3个110级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20256, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y120级#W百铁精炼#24")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20256, 3)
		    player:GetItems():AddItem(20257,1)
		  end
		  end
		  		  elseif GetAnswer() == 9 then
    NpcAsk("合成120级精铁需要#Y3个#P110级精铁#W,和10万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 100000 then
        NpcSay("合成需要银两50万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20257) < 3 then   --50级精铁
		    NpcSay("合成120级精铁需要3个110级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20257, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y120级#W百铁精炼#24")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20257, 3)
		    player:GetItems():AddItem(20258,1)
		  end
		  end
		  		  elseif GetAnswer() == 10 then
    NpcAsk("合成120级精铁需要#Y3个#P110级精铁#W,和10万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 100000 then
        NpcSay("合成需要银两50万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20258) < 3 then   --50级精铁
		    NpcSay("合成120级精铁需要3个110级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20258, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y120级#W百铁精炼#24")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20258, 3)
		    player:GetItems():AddItem(20259,1)
		  end
		  end
		  		  elseif GetAnswer() == 11 then
    NpcAsk("合成120级精铁需要#Y3个#P110级精铁#W,和10万银两,合成有一定几率损失一块精铁,您确定要进行合成吗?")
    SetAnswer(1,"确定")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 100000 then
        NpcSay("合成需要银两50万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20259) < 3 then   --50级精铁
		    NpcSay("合成120级精铁需要3个110级精铁才可以进行合成！")
		    return
		  end
		  if i < 5 then
		    NpcSay("合成失败,损失了一块精铁")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20259, 1)
		  elseif i <= 10 then
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y120级#W百铁精炼#24")
		    player:ChangeMoney(-100000)
		    player:GetItems():RemoveItem(20259, 3)
		    player:GetItems():AddItem(20260,1)
		  end	
end		  
  elseif GetAnswer() == 5 then
    NpcAsk("您确定要进行合成吗?\\r90强化精铁需要90精铁X1和四神石各3个\\r100强化精铁需要100精铁X1和四神石各5个\\r110强化精铁需要110精铁X1和四神石各9个\\r120强化精铁需要120精铁X1和四神石各15个\\r130强化精铁需要130精铁X1和四神石各20个\\r140强化精铁需要140精铁X1和四神石各25个\\r150强化精铁需要150精铁X1和四神石各30个")
    SetAnswer(1,"90级强化百炼精铁")
    SetAnswer(2,"100级强化百炼精铁")
    SetAnswer(3,"110级强化百炼精铁")
    SetAnswer(4,"120级强化百炼精铁")
    SetAnswer(5,"130级强化百炼精铁")
    SetAnswer(6,"140级强化百炼精铁")	
	SetAnswer(7,"150级强化百炼精铁")
    SetAnswer(12,"离开")
    WaitAnswer(12)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20254) < 1 then   --50级精铁
		    NpcSay("合成需要1个90级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 3 then   --50级精铁
		    NpcSay("合成需要3个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 3 then   --50级精铁
		    NpcSay("合成需要3个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 3 then   --50级精铁
		    NpcSay("合成需要3个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 3 then   --50级精铁
		    NpcSay("合成需要3个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y90级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20254, 1)				
		    player:GetItems():RemoveItem(15006, 3)
		    player:GetItems():RemoveItem(15007, 3)
		    player:GetItems():RemoveItem(15008, 3)
		    player:GetItems():RemoveItem(15009, 3)			
		    player:GetItems():AddItem(20754,1)
		  end
	   if GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20255) < 1 then   --50级精铁
		    NpcSay("合成需要1个100级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 5 then   --50级精铁
		    NpcSay("合成需要5个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 5 then   --50级精铁
		    NpcSay("合成需要5个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 5 then   --50级精铁
		    NpcSay("合成需要5个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 5 then   --50级精铁
		    NpcSay("合成需要5个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y100级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20255, 1)				
		    player:GetItems():RemoveItem(15006, 5)
		    player:GetItems():RemoveItem(15007, 5)
		    player:GetItems():RemoveItem(15008, 5)
		    player:GetItems():RemoveItem(15009, 5)			
		    player:GetItems():AddItem(20755,1)
		  end
	   if GetAnswer() == 3 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20256) < 1 then   --50级精铁
		    NpcSay("合成需要1个110级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 9 then   --50级精铁
		    NpcSay("合成需要9个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 9 then   --50级精铁
		    NpcSay("合成需要9个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 9 then   --50级精铁
		    NpcSay("合成需要9个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 9 then   --50级精铁
		    NpcSay("合成需要9个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y110级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20256, 1)				
		    player:GetItems():RemoveItem(15006, 9)
		    player:GetItems():RemoveItem(15007, 9)
		    player:GetItems():RemoveItem(15008, 9)
		    player:GetItems():RemoveItem(15009, 9)			
		    player:GetItems():AddItem(20756,1)
		  end		  
	   if GetAnswer() == 4 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20257) < 1 then   --50级精铁
		    NpcSay("合成需要1个120级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 15 then   --50级精铁
		    NpcSay("合成需要15个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 15 then   --50级精铁
		    NpcSay("合成需要15个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 15 then   --50级精铁
		    NpcSay("合成需要15个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 15 then   --50级精铁
		    NpcSay("合成需要15个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y120级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20257, 1)				
		    player:GetItems():RemoveItem(15006, 15)
		    player:GetItems():RemoveItem(15007, 15)
		    player:GetItems():RemoveItem(15008, 15)
		    player:GetItems():RemoveItem(15009, 15)			
		    player:GetItems():AddItem(20757,1)
		  end	
	   if GetAnswer() == 5 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20258) < 1 then   --50级精铁
		    NpcSay("合成需要1个130级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 20 then   --50级精铁
		    NpcSay("合成需要20个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 20 then   --50级精铁
		    NpcSay("合成需要20个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 20 then   --50级精铁
		    NpcSay("合成需要20个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 20 then   --50级精铁
		    NpcSay("合成需要20个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y130级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20258, 1)				
		    player:GetItems():RemoveItem(15006, 20)
		    player:GetItems():RemoveItem(15007, 20)
		    player:GetItems():RemoveItem(15008, 20)
		    player:GetItems():RemoveItem(15009, 20)			
		    player:GetItems():AddItem(20758,1)
		  end	
	   if GetAnswer() == 6 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20259) < 1 then   --50级精铁
		    NpcSay("合成需要1个140级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 25 then   --50级精铁
		    NpcSay("合成需要25个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 25 then   --50级精铁
		    NpcSay("合成需要25个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 25 then   --50级精铁
		    NpcSay("合成需要25个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 25 then   --50级精铁
		    NpcSay("合成需要25个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y140级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20259, 1)				
		    player:GetItems():RemoveItem(15006, 25)
		    player:GetItems():RemoveItem(15007, 25)
		    player:GetItems():RemoveItem(15008, 25)
		    player:GetItems():RemoveItem(15009, 25)			
		    player:GetItems():AddItem(20759,1)		  
		end
	   if GetAnswer() == 7 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 90000 then
        NpcSay("合成需要银两9万,你的钱不足以支付")
        return
      end
		  if player:GetItems():GetItemCount(20260) < 1 then   --50级精铁
		    NpcSay("合成需要1个150级百炼精铁")
		    return
		  end	  
		  if player:GetItems():GetItemCount(15006) < 30 then   --50级精铁
		    NpcSay("合成需要30个白虎石")
		    return
		  end
		  if player:GetItems():GetItemCount(15007) < 30 then   --50级精铁
		    NpcSay("合成需要30个朱雀石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15008) < 30 then   --50级精铁
		    NpcSay("合成需要30个青龙石")
		    return
		  end	
		  if player:GetItems():GetItemCount(15009) < 30 then   --50级精铁
		    NpcSay("合成需要30个玄武石")
		    return
		  end		  
		    ShowHint("炼铁炉透着微微红光,掉落出一块#Y150级#W百铁精炼#24")
		    player:ChangeMoney(-90000)
		    player:GetItems():RemoveItem(20260, 1)				
		    player:GetItems():RemoveItem(15006, 30)
		    player:GetItems():RemoveItem(15007, 30)
		    player:GetItems():RemoveItem(15008, 30)
		    player:GetItems():RemoveItem(15009, 30)			
		    player:GetItems():AddItem(20760,1)		
  end
  
end
end

 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00698)
