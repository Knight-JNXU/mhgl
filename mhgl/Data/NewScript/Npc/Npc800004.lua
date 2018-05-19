--wangzl


Npc300434 = {							
	npc_id = 300434,				--雪人一
	name = GetNpcName(300434),	
}

 
function Npc300434:Talk(bProcess)
	NpcAsk("\\r堆呀堆，堆雪人，圆圆脸儿胖墩墩。\\r大雪人，真神气，冰天雪地笑眯眯。\\r不怕冷，不怕冻，我们一起做游戏。")
	SetAnswer(1, "我也来堆雪人")
	--SetAnswer(2, "传送")
	SetAnswer(3, "等会再来")
	WaitAnswer(3)
	if GetAnswer() == 1 then
		if player:GetItems():HasItem(60129) then
			if player:GetItems():GetFreeSlot(0) < 1 then
				NpcSay("堆雪人有可能获得很好的奖励哦，还是把当前包裹整理一下再来吧。")
				return
			end
			if bProcess then
				script:SetSaying(true)
				player:GetItems():RemoveItem(60129,1)
				local lv = player:GetLevel()
				local score = 1
				local flag6916 = player:GetQuests():GetFlag(6916)    --总积分
				player:GetQuests():SetFlag(6916,flag6916+score)
				local Exp = lv*lv*20
				local Smoney = lv*50*5
				player:ChangeExp(Exp,5)
				player:ChangeSMoney(Smoney,5)	
				ShowError(string.format("\#W获得经验值%d", Exp))
				ShowError(string.format("\#W获得储备金%d", Smoney))
				ShowError("\#W获得活动积分1")
				local  rand_1 = math.random(1,100)
				if rand_1 <= 33 then
					self:GetTwo()
				end
			end
		else
			NpcSay("没有雪块怎么堆雪人呢，快去找点雪块来吧。")
		end
  elseif GetAnswer() == 2 then
    player:JumpMap(1,67,205)
  end
end

function Npc300434:GetTwo()
  item = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110})
  local A = math.random(1,200)
  if A <= 5 then
    player:GetItems():AddItem(item,1)	
	  ShowError(string.format("\#W获得%s",GetItemName(item)))
	  script:Rumor(string.format("在堆雪人的时候，\#W%s\#O意外收获了一个\#B%s\#O，顿时热血沸腾，大喊一声：堆雪人，真棒！#97", player:GetName(), GetItemName(item)), false)								
  elseif A <= 10 then
    item = 30001
    player:GetItems():AddItem(item,1)	
	  ShowError(string.format("\#W获得%s",GetItemName(item)))
	  script:Rumor(string.format("在堆雪人的时候，\#W%s\#O意外收获了一个\#B%s\#O，顿时热血沸腾，大喊一声：堆雪人，真棒！#97", player:GetName(), GetItemName(item)), false)								
  elseif A <= 20 then
    item = 30000
    player:GetItems():AddItem(item,1)	
	  ShowError(string.format("\#W获得%s",GetItemName(item)))
	  script:Rumor(string.format("在堆雪人的时候，\#W%s\#O意外收获了一个\#B%s\#O，顿时热血沸腾，大喊一声：堆雪人，真棒！#97", player:GetName(), GetItemName(item)), false)								
  elseif A <= 33 then
    item = 20000
    player:GetItems():AddItem(item,1)	
	  ShowError(string.format("\#W获得%s",GetItemName(item)))
	  script:Rumor(string.format("在堆雪人的时候，\#W%s\#O意外收获了一个\#B%s\#O，顿时热血沸腾，大喊一声：堆雪人，真棒！#97", player:GetName(), GetItemName(item)), false)								
  end
end

AddNpcTable(Npc300434)


