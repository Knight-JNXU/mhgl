-- 补偿大师 每日礼物 510
Npc00510 = {}
Npc00510.npc_id = 510
Npc00510.name = GetNpcName(510)

Npc00510.Talk = function(l_1_0, l_1_1)
  
  if npc then
    local TotalRound610 = 0
    local type610 = player:GetQuests():GetType(8888)
	local flag = player:GetQuests():GetFlag(19879)
    if type610 ~= nil then
      TotalRound610 = type610:GetTotalRound()
    end
    NpcAsk(string.format("#E%s#A欢迎来到签到系统，小小福利送给坚持不懈的你\r#P你目前签到天数为：#Y%d#P天",player:GetName(), flag))
    --SetAnswer(1, "签到")
	--SetAnswer(2, "VIP签到")
    --SetAnswer(3, "签到积分兑换")
	--SetAnswer(3, "\230\137\147\233\128\160\49\48\48\45\49\52\48\232\163\133\229\164\135")
	--SetAnswer(4, "\230\137\147\233\128\160\229\133\137\230\173\166\230\173\166\229\153\168")
    SetAnswer(5, "\231\166\187\229\188\128")
    WaitAnswer(5)
    if GetAnswer() == 1 then
        if TotalRound610 >= 1 then
          ShowHint("每天只能签到一次")
          return
        end
      if player:GetLevel() < 65 then
      ShowHint("没有65级我不接受你的签到")
      return 
    end
        if l_1_1 then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(8888, 1, 1, 1)
            type610 = player:GetQuests():GetType(8888)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
          --发奖励
		      player:GetQuests():SetFlag(19879, flag + 1)
			  		  player:ChangeExpForScript(1000000, 1)
     local itemid = RandTable({600004})
     player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    -- script:Rumor(string.format("%s #O坚持不懈的每日前来签到，特给予#Y%s #O以资鼓历#101#101#101", player:GetCharNameLink(), GetItemName(itemid)), false)
  
  end 
  end
    if GetAnswer() == 2 then
        if TotalRound610 >= 1 then
          ShowHint("\228\189\160\228\187\138\229\164\169\229\183\178\231\187\143\231\173\190\229\136\176\232\191\135\228\186\134")
          return
        end
    if player:GetItems():GetItemCount(51402) < 1 then
      NpcSay("不是VIP，请不要围观！")
      return 
    end
        if l_1_1 then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(8888, 1, 1, 1)
            type610 = player:GetQuests():GetType(8888)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
          --发奖励
		      player:GetQuests():SetFlag(19879, flag + 1)
              player:ChangeMoney(50000)
		  player:ChangeExpForScript(500000, 1)
		  player:GetItems():AddItem(401669, 1)
          --player:GetItems():AddItemForScript(402747, 1)       
          script:Rumor(string.format("#A %s #O在京城#A【心鉴大师】#O那里VIP签到，获得#B银两5W经验50W绑定元宝100#O！#020奖历虽少，但也是本服对大家的一点小心意，各位可要坚持哟#029", player:GetCharNameLink(),GetItemName(61021)), false)
       	end
		end		
    if GetAnswer() == 3 then
	script:SetSaying(true)
		NpcAsk(string.format("祝您购物愉快！\r你的签到天数为：#R %d", flag))
		--SetAnswer(1, "兑换吸血鬼宝宝（15天）")
		--SetAnswer(2, "兑换盛世重阳糕X5（1天）")
		--SetAnswer(3, "兑换秘制资质丹礼包（1天）")
		--SetAnswer(4, "兑换修炼丹盒X1（2天）")
		--SetAnswer(5, "兑换1000绑定元宝卡（2天）")
		--SetAnswer(6, "兑换成长丹（15天）")
		SetAnswer(7, "金柳露             （1天）")
		SetAnswer(8, "兑换神兜兜X9       （1天）")
		SetAnswer(9, "兑换坐骑-洞天福兽  （10天）")
		SetAnswer(10, "兑换30天VIP卡     （35天）")
		SetAnswer(12, "我就看看")
		WaitAnswer(13)
	if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 15 then
        NpcSay("你的签到天数不足#R15#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 15)
      player:GetPartners():AddPartner(RandTable({7041,7041}), 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R吸血鬼宝宝#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 1)
      player:GetItems():AddItem(64304, 5)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了5个#R盛世重阳糕#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 1)
      player:GetItems():AddItem(401647, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R秘制资质丹礼包#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 1)
      player:GetItems():AddItem(80055, 2)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R修炼丹盒X2#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 2 then
        NpcSay("你的签到天数不足#R2#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 2)
      player:GetItems():AddItem(401670, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R绑定元宝卡（大）#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 15 then
        NpcSay("你的签到天数不足#R15#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 15)
      player:GetItems():AddItem(401643, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R成长丹#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R2#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 1)
      player:GetItems():AddItem(30000, 1)
      script:Rumor(string.format("#E %s #O用签到积分兑换了一个#R金柳露#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 1)
      player:GetItems():AddItem(40039, 9)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R神兜兜X9#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 10 then
        NpcSay("你的签到天数不足#R10#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 10)
player:GetPets():AddPet(RandTable{297})
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了坐骑#R洞天福兽#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(19879)
      script:SetSaying(true)
      if flag < 35 then
        NpcSay("你的签到天数不足#R35#W天")
        return
      end
      player:GetQuests():SetFlag(19879, flag - 35)
      player:GetItems():AddItem(51402, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R30天VIP卡#28", player:GetName()), false)
      player:GetOwner()
    end	
    elseif GetAnswer() == 3 then
          NpcAsk("\232\175\183\233\128\137\230\139\169\239\188\140\228\189\160\232\166\129\230\137\147\233\128\160\231\154\132\232\163\133\229\164\135\239\188\129")
          SetAnswer(1, "\230\137\147\233\128\160\230\173\166\229\153\168")
          SetAnswer(2, "\230\137\147\233\128\160\233\152\178\229\133\183")
          SetAnswer(3, "\230\137\147\233\128\160\233\165\176\229\147\129")
          SetAnswer(4, "\230\154\130\230\151\182\228\184\141\230\137\147\233\128\160")
          WaitAnswer(4)
          if GetAnswer() == 1 and l_1_1 then
            script:OpenInterface("mixshop", 9)
          elseif GetAnswer() == 2 and l_1_1 then
            script:OpenInterface("mixshop",12)
          elseif GetAnswer() == 3 and l_1_1 then
            script:OpenInterface("mixshop",15)
          end
    elseif GetAnswer() == 4 then
         script:OpenInterface("mixshop", 20) 
    else  
      --type610:ChangeTotalRound(-1)
    end
  end
end
AddNpcTable(Npc00510)
