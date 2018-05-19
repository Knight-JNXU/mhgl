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
    NpcAsk(string.format("#V大侠快来救我#Y\\r请将拘灵妖怪、囚神妖怪、缚仙妖怪消灭后再找出假国王消灭掉#V\\r副本积分为：#R%d#P", flag))
   SetAnswer(1, "已消灭拘灵妖怪")
   SetAnswer(2, "已消灭囚神妖怪") 
   SetAnswer(3, "已消灭缚仙妖怪")   
   SetAnswer(4, "领取通关奖励")
   SetAnswer(12, "回长安") 
    SetAnswer(15, "我去杀妖")
    WaitAnswer(15)
    if GetAnswer() == 1 then
        if TotalRound61101 >= 10 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1014) == false then
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
		  	 player:GetQuests():SetFlag(60230, flag + 5)
               player:RemoveTitle(1014)	
	   --player:GetItems():RemoveItem(402901, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分5点")	
    --ShowError("#W获得神秘变身卡")		
			  end
  
    if GetAnswer() == 2 then
        if TotalRound61101 >= 12 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1015) == false then
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
		  	 player:GetQuests():SetFlag(60230, flag + 5)
               player:RemoveTitle(1015)	
	   --player:GetItems():RemoveItem(402901, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分5点")	
    --ShowError("#W获得神秘变身卡")		
			  end
      if GetAnswer() == 3 then
        if TotalRound61101 >= 13 then
          ShowHint("每人一天只能领取一次")
          return
        end
      if player:GetLevel() < 69 then
      ShowHint("69级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 69 or player:HasTitle(1016) == false then
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
    player:AddTitle(1017)
		  	 player:GetQuests():SetFlag(60230, flag + 5)
               player:RemoveTitle(1016)	
	   player:GetItems():RemoveItem(402911, 30) 		   
			--player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
                script:Rumor(string.format("#W%s#O在#R乌鸡副本#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分5点")	
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
   if player:GetLevel() < 69 or player:HasTitle(1019) == false then
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
				player:RemoveTitle(1017)
				player:RemoveTitle(1018)
				player:RemoveTitle(1019)				
		  	 player:GetQuests():SetFlag(60230, flag + 20)			 
	   player:GetItems():AddItem(402911, 1)		   
	itemid = RandTable({402800, 402801, 30000, 30001, 20000, 20001, 15007, 15008, 15009, 60414, 60424, 60434, 60444, 60454, 60464, 60474, 60404, 400040, 400041, 400042, 400043, 400044, 400045, 400046, 400047, 400048, 30009})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format("#O恭喜#W %s #O完美通关#R乌鸡副本#O，意外得到神仙给了一個#B%s#O#86#86#86", player:GetCharNameLink(), GetItemName(itemid)), false)
			
			     end
    ShowError("#W获得副本积分10点")	
    --ShowError("#W获得神秘变身卡")		
			  end 
   
	  if GetAnswer() == 12 then
    player:JumpMap(34,97,249)
  end
end
end
AddNpcTable(Npc00510)
