Preload("Inst00010.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00359 = {							-- 杵官王
	npc_id = 359,						-- NPC ID
	name = GetNpcName(359),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00359:Talk(bProcess) 
 if npc then
    local TotalRound610 = 0
    local type610 = player:GetQuests():GetType(9998)
	local flag = player:GetQuests():GetFlag(24568)
    if type610 ~= nil then
      TotalRound610 = type610:GetTotalRound()
    end
  NpcAsk("我是唐王任命专门负责处理副本冒险相关事宜的官员，这方面有什么业务直接找我好了。")
  SetAnswer(1,"我来兑换副本奖励")
  SetAnswer(2,"我要开启乌鸡副本")  
  SetAnswer(3,"随便看看")
  WaitAnswer(3)
	if GetAnswer() == 1 then
	local flag = player:GetQuests():GetFlag(60230)	
	script:SetSaying(true)
NpcAsk(string.format("你可用的副本积分为：#R %d\\r每次兑换需另收10W银两手续费", flag))
			SetAnswer(1, "兑换普通盒子（5积分）")
			SetAnswer(2, "兑换低级盒子（10积分）")
			SetAnswer(3, "兑换中级盒子（20积分）")	
			SetAnswer(4, "10E金丹     （2积分）")
			--SetAnswer(5, "兑换大唐孩子 (1000积分)")	
            SetAnswer(6, "兑换化生孩子 (1000积分)")	
            SetAnswer(7, "兑换盘丝孩子 (1000积分)")	
            SetAnswer(8, "兑换龙宫孩子 (1000积分)")				
			SetAnswer(12, "离开")			
			WaitAnswer(12)
	if GetAnswer() == 1 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的积分不足#R5")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 5)
	  player:ChangeMoney(-100000)
      player:GetItems():AddItem(600010, 1)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#普通盒子#124", player:GetName()), false)
      player:GetOwner()
    end		
	if GetAnswer() == 2 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 10 then
        NpcSay("你的积分不足#R10")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 10)
	  player:ChangeMoney(-100000)
      player:GetItems():AddItem(600011, 1)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y低级盒子#124", player:GetName()), false)
      player:GetOwner()
    end		
	if GetAnswer() == 3 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 20 then
        NpcSay("你的积分不足#R20")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 20)
	  player:ChangeMoney(-100000)
      player:GetItems():AddItem(600012, 1)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y中级盒子#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 4 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 2 then
        NpcSay("你的积分不足#R2")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 2)
	  player:ChangeMoney(-100000)
      player:GetItems():AddItem(61041, 1)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y金丹#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 5 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 1000 then
        NpcSay("你的积分不足#R1000")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 1000)
	  player:ChangeMoney(-100000)
      player:GetPartners():AddPartner(2029)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y孩子#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 6 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 1000 then
        NpcSay("你的积分不足#R1000")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 1000)
	  player:ChangeMoney(-100000)
      player:GetPartners():AddPartner(2027)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y孩子#124", player:GetName()), false)
      player:GetOwner()
    end	
		if GetAnswer() == 7 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 1000 then
        NpcSay("你的积分不足#R1000")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 1000)
	  player:ChangeMoney(-100000)
      player:GetPartners():AddPartner(2028)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y孩子#124", player:GetName()), false)
      player:GetOwner()
    end	
if GetAnswer() == 8 then
	local flag = player:GetQuests():GetFlag(60230)	
      script:SetSaying(true)
      if flag < 1000 then
        NpcSay("你的积分不足#R1000")
        return
      end
      if player:GetMoney() < 100000 then
        NpcSay("需要银两#P10万")
        return
      end	  
      player:GetQuests():SetFlag(60230, flag - 1000)
	  player:ChangeMoney(-1000000)
      player:GetPartners():AddPartner(2030)
      script:Rumor(string.format("#E %s #O在#R副本官员#O那里兑换了一个#Y孩子#124", player:GetName()), false)
      player:GetOwner()
    end	
	end
		if GetAnswer() == 2 then
		  NpcAsk("本副本只能单人组队玩成，如不听本官指示，本官不予理会。")
			SetAnswer(1, "我要开启副本")
			SetAnswer(2, "离开")			
			WaitAnswer(2)
		if GetAnswer() == 1 then		
		if bProcess then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(9998, 1, 1, 1)
            type610 = player:GetQuests():GetType(9998)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
		       player:GetQuests():SetFlag(24568, flag + 1)
				player:JumpMap(503, 62, 24)
			end	
          end
        end
    end
end
 
    












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00359)
