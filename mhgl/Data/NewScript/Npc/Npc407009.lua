-- 补偿大师 每日礼物 510
Npc00510 = {}
Npc00510.npc_id = 510
Npc00510.name = GetNpcName(510)

Npc00510.Talk = function(l_1_0, l_1_1)
  
  if npc then
    local TotalRound61101 = 0
    local type61101 = player:GetQuests():GetType(188887)
	local flag = player:GetQuests():GetFlag(60230)
    if type61101 ~= nil then
      TotalRound61101 = type61101:GetTotalRound()
    end
    NpcAsk(string.format("#E小盆友,我就是传说中的仙人,你有什么愿望？#Y\\r请将本地图的妖怪都消灭一次再来领取奖历，不然不能继续副本请自己负责！#E\\r副本积分为：#Y%d#P", flag))
   SetAnswer(1, "消灭树妖")
   SetAnswer(2, "消灭怵")
   SetAnswer(3, "消灭荆棘丛")	
   SetAnswer(4, "消灭荆棘丛领取大礼包")
   SetAnswer(12, "进去下一环") 
    SetAnswer(15, "我去杀妖")
    WaitAnswer(15)
    if GetAnswer() == 1 then
        if TotalRound61101 >= 1 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1010) == false then
		ShowHint("那里来小毛孩赶紧回家")
		return false
		end		
        if l_1_1 then
          if type61101 == nil then
            player:GetQuests():SetRoundInfo(188887, 1, 1, 1)
            type61101 = player:GetQuests():GetType(188887)
            type61101:ChangeTotalRound(1)
          else
            type61101:ChangeTotalRound(1)
          end
          --发奖励
		  	 player:GetQuests():SetFlag(60230, flag + 2)
               player:RemoveTitle(1010)	
	   --player:GetItems():RemoveItem(402901, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分2点")	
    --ShowError("#W获得神秘变身卡")		
			  end
  
    if GetAnswer() == 2 then
        if TotalRound61101 >= 2 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1011) == false then
		ShowHint("那里来小毛孩赶紧回家")
		return false
		end		
        if l_1_1 then
          if type61101 == nil then
            player:GetQuests():SetRoundInfo(188887, 1, 1, 1)
            type61101 = player:GetQuests():GetType(188887)
            type61101:ChangeTotalRound(1)
          else
            type61101:ChangeTotalRound(1)
          end
          --发奖励
		  	 player:GetQuests():SetFlag(60230, flag + 2)
               player:RemoveTitle(1011)	
	   --player:GetItems():RemoveItem(402901, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分2点")	
    --ShowError("#W获得神秘变身卡")		
			  end
      if GetAnswer() == 3 then
        if TotalRound61101 >= 3 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1012) == false then
		ShowHint("那里来小毛孩赶紧回家")
		return false
		end		
        if l_1_1 then
          if type61101 == nil then
            player:GetQuests():SetRoundInfo(188887, 1, 1, 1)
            type61101 = player:GetQuests():GetType(188887)
            type61101:ChangeTotalRound(1)
          else
            type61101:ChangeTotalRound(1)
          end	
    player:AddTitle(1013)
		  	 player:GetQuests():SetFlag(60230, flag + 3)
               player:RemoveTitle(1012)	
	   --player:GetItems():RemoveItem(402901, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分3点")	
    --ShowError("#W获得神秘变身卡")		
			  end
        if GetAnswer() == 4 then
        if TotalRound61101 >= 4 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1013) == false then
		ShowHint("前面的你做好了没有")
		return false
		end		
        if l_1_1 then
          if type61101 == nil then
            player:GetQuests():SetRoundInfo(188887, 1, 1, 1)
            type61101 = player:GetQuests():GetType(188887)
            type61101:ChangeTotalRound(1)
          else
            type61101:ChangeTotalRound(1)
          end	
				player:RemoveTitle(1010)
				player:RemoveTitle(1011)
				player:RemoveTitle(1012)				
		  	 player:GetQuests():SetFlag(60230, flag + 5)			 
               player:RemoveTitle(1013)	
	   player:GetItems():AddItem(402911, 1)		   
	itemid = RandTable({402800, 402801, 30000, 30001, 20000, 20001, 15007, 15008, 15009, 60414, 60424, 60434, 60444, 60454, 60464, 60474, 60404, 400040, 400041, 400042, 400043, 400044, 400045, 400046, 400047, 400048, 30009})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format("%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，意外得到神仙给了一個#B%s#O#86#86#86", player:GetCharNameLink(), GetItemName(itemid)), false)
			
			     end
    ShowError("#W获得副本积分5点")	
    --ShowError("#W获得神秘变身卡")		
			  end 
   
	  if GetAnswer() == 12 then
    if player:GetItems():GetItemCount(402911) < 1 then
      NpcSay("本地图的怪你都清理掉了吗")
      return 
    end
    player:JumpMap(504,34,110)
  end
end
end
AddNpcTable(Npc00510)
