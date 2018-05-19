-- 补偿大师 每日礼物 510
Npc00510 = {}
Npc00510.npc_id = 510
Npc00510.name = GetNpcName(510)

Npc00510.Talk = function(l_1_0, l_1_1)
  
  if npc then
    local TotalRound61100 = 0
    local type61100 = player:GetQuests():GetType(188888)
	local flag = player:GetQuests():GetFlag(60230)
    if type61100 ~= nil then
      TotalRound61100 = type61100:GetTotalRound()
    end
    NpcAsk(string.format("#E朕乃万岁！\\r你的副本积分为：#Y%d#P", flag))
   SetAnswer(1, "妖怪团灭")
   SetAnswer(2, "回长安") 
    SetAnswer(5, "我去杀妖")
    WaitAnswer(5)
    if GetAnswer() == 1 then
        if TotalRound61100 >= 1 then
          ShowHint("每人一天只能通关一次副本")
          return
        end
      if player:GetLevel() < 110 then
      ShowHint("110级以下的战五渣，我怎么可能相信你能打过妖怪")
      return 
    end
   if player:GetLevel() < 110 or player:HasTitle(1001) == false then
		ShowHint("那里来小毛孩赶紧回家")
		return false
		end		
        if l_1_1 then
          if type61100 == nil then
            player:GetQuests():SetRoundInfo(188888, 1, 1, 1)
            type61100 = player:GetQuests():GetType(188888)
            type61100:ChangeTotalRound(1)
          else
            type61100:ChangeTotalRound(1)
          end
          --发奖励
		  	 player:GetQuests():SetFlag(60230, flag + 60)
               player:RemoveTitle(1001)
               player:RemoveTitle(1000)
               player:RemoveTitle(999)
               player:RemoveTitle(998)
               player:RemoveTitle(997)
               player:RemoveTitle(996)
               player:RemoveTitle(995)	
	   player:GetItems():RemoveItem(402901, 30) 		   
			player:GetItems():AddItem(RandTable{400050, 400053, 400054, 400051, 400053, 400054,400052, 400053, 400054, 400055, 400053, 400054}, 1)
script:Rumor(string.format("#W%s#O在#R水陆法会#O上大展身手消灭不少妖怪，让我们向英雄致敬#86#86#86", player:GetName()), false)
			
			     end
    ShowError("#W获得副本积分60点")	
    ShowError("#W获得神秘变身卡")		
			  end
    end
	  if GetAnswer() == 2 then

    player:JumpMap(34,97,249)
  end
end

AddNpcTable(Npc00510)
