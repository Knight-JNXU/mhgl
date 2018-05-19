
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00353 = {							-- 杵官王
	npc_id = 353,						-- NPC ID
	name = GetNpcName(353),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00353:Talk(bProcess) 
	local TotalRound600 = 0;
	local TotalRound601 = 0;
	local type600 = player:GetQuests():GetType(600);
	if type600 ~= nil then
		TotalRound600 = type600:GetTotalRound();
	end
	local type601 = player:GetQuests():GetType(601);
    if type601 ~= nil then
		TotalRound601 = type601:GetTotalRound();
	end
  NpcAsk(string.format("欢迎来到KJ公益服。本周角色剩余双倍时间：#P%s#W小时\r请注意:#Y双倍时间领取以后不能冻结,请妥善领取双倍时间！", 72-TotalRound600))
  SetAnswer(1,"领取") 
  SetAnswer(2,"离开") 
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if party then
      NpcAskParty("请问需要领取几个小时")
      SetAnswer(1,"1小时")
      SetAnswer(2,"2小时")
      SetAnswer(3,"离开")
      WaitAnswer(3)
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        local answer = GetAnswer(i)
	      local TotalRound600 = 0;
	      local TotalRound601 = 0;
	      local type600 = member:GetQuests():GetType(600);
	      if type600 ~= nil then
		      TotalRound600 = type600:GetTotalRound();
	      end
	      local type601 = member:GetQuests():GetType(601);
	      if type601 ~= nil then
	        TotalRound601 = type601:GetTotalRound();
	      end
        if answer == 1 and bProcess then
          script:SetSaying(true)
          if TotalRound600 >= 72 then
            ShowHint("本周使用次数已达到上限。",member)
            return
          end
          if member:HasBuff(218) then
            local Buff218 = member:FindBuff(218)
            local Buff218CoolDown = Buff218:GetBuffCoolDown() 
            if Buff218CoolDown > 10800 then
              ShowHint("双倍经验的叠加时间不得超过4小时",member)
            else
              ShowHint("成功领取1小时双倍经验",member)
              NewBuff218CoolDown = (Buff218CoolDown + 3600) /60;
              member:AddBuff(218, 0, 0, 0, NewBuff218CoolDown, 100)
              if type600 == nil then
                member:GetQuests():SetRoundInfo(600, 1, 72, 2);
                type600 = member:GetQuests():GetType(600);
                type600:ChangeTotalRound(1)
              else
                type600:ChangeTotalRound(1)
              end
            end
          else
            ShowHint("成功领取1小时双倍经验",member)
            member:AddBuff(218, 0, 0, 0, 60, 100)
            if type600 == nil then
              member:GetQuests():SetRoundInfo(600, 1, 72, 2);
              type600 = member:GetQuests():GetType(600);
              type600:ChangeTotalRound(1)
            else
              type600:ChangeTotalRound(1)
            end
          end
		if member:HasBuff(246) then
			local Buff246 = member:FindBuff(246)
			local Buff246CoolDown = Buff246:GetBuffCoolDown() 
			if Buff246CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				NewBuff246CoolDown = (Buff246CoolDown + 3600) /60;
				member:AddBuff(246, 0, 0, 0, NewBuff246CoolDown, 100)
				if type601 == nil then
					member:GetQuests():SetRoundInfo(601, 1, 72, 2);
					type601 = member:GetQuests():GetType(601);
					type601:ChangeTotalRound(1)
				else
					type601:ChangeTotalRound(1)
				end		
			end
		else
			member:AddBuff(246, 0, 0, 0, 60, 100)
			if type601 == nil then
				member:GetQuests():SetRoundInfo(601, 1, 72, 2);
				type601 = member:GetQuests():GetType(601);
				type601:ChangeTotalRound(1)
			else
				type601:ChangeTotalRound(1)
			end
	  end
        elseif answer == 2 and bProcess then
          script:SetSaying(true)
          if TotalRound600 >= 72 then
            ShowHint("本周使用次数已达到上限。",member)
            return
          end
          if member:HasBuff(218) then
            local Buff218 = member:FindBuff(218)
            local Buff218CoolDown = Buff218:GetBuffCoolDown() 
            if Buff218CoolDown > 10800 then
              ShowHint("双倍经验的叠加时间不得超过4小时",member)
            else
              ShowHint("成功领取2小时双倍经验",member)
              NewBuff218CoolDown = (Buff218CoolDown + 7200) /60;
              member:AddBuff(218, 0, 0, 0, NewBuff218CoolDown, 100)
              if type600 == nil then
                member:GetQuests():SetRoundInfo(600, 1, 72, 2);
                type600 = member:GetQuests():GetType(600);
                type600:ChangeTotalRound(1)
              else
                type600:ChangeTotalRound(1)
              end
            end
          else
            ShowHint("成功领取2小时双倍经验",member)
            member:AddBuff(218, 0, 0, 0, 120, 100)
            if type600 == nil then
              member:GetQuests():SetRoundInfo(600, 1, 72, 2);
              type600 = member:GetQuests():GetType(600);
              type600:ChangeTotalRound(1)
            else
              type600:ChangeTotalRound(1)
            end
          end
        if member:HasBuff(246) then
			local Buff246 = member:FindBuff(246)
			local Buff246CoolDown = Buff246:GetBuffCoolDown() 
			if Buff246CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				NewBuff246CoolDown = (Buff246CoolDown + 7200) /60;
				member:AddBuff(246, 0, 0, 0, NewBuff246CoolDown, 100)
				if type601 == nil then
					member:GetQuests():SetRoundInfo(601, 1, 72, 2);
					type601 = member:GetQuests():GetType(601);
					type601:ChangeTotalRound(1)
				else
					type601:ChangeTotalRound(1)
				end		
			end
		else
			member:AddBuff(246, 0, 0, 0, 120, 100)
			if type601 == nil then
				member:GetQuests():SetRoundInfo(601, 1, 72, 2);
				type601 = member:GetQuests():GetType(601);
				type601:ChangeTotalRound(1)
			else
				type601:ChangeTotalRound(1)
			end
	  end
        end
      end
    else
      NpcAsk(string.format("奉唐王圣喻，凡有心效力朝廷者可以在这里领取雇佣时间，可得额外奖励。本周角色剩余双倍时间：#P%s#W小时\r请注意:#Y双倍时间领取以后不能冻结,请妥善领取双倍时间！", 72-TotalRound600))
      SetAnswer(1,"领取一小时")
      SetAnswer(2,"领取两小时")
      SetAnswer(6,"取消")
      WaitAnswer(6)
      
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
		if TotalRound600 >= 72 then
			ShowHint("本周使用次数已达到上限。")
			return
		end
   
		
		
		
		
		
		
		if player:HasBuff(218) then
			local Buff218 = player:FindBuff(218)
			local Buff218CoolDown = Buff218:GetBuffCoolDown() 
			if Buff218CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				ShowHint("成功领取1小时双倍经验")
				NewBuff218CoolDown = (Buff218CoolDown + 3600) /60;
				player:AddBuff(218, 0, 0, 0, NewBuff218CoolDown, 100)
		
				if type600 == nil then
					player:GetQuests():SetRoundInfo(600, 1, 72, 2);
					type600 = player:GetQuests():GetType(600);
					type600:ChangeTotalRound(1)
				else
					type600:ChangeTotalRound(1)
				end	
			end
		else
			ShowHint("成功领取1小时双倍经验")
			player:AddBuff(218, 0, 0, 0, 60, 100)
			if type600 == nil then
				player:GetQuests():SetRoundInfo(600, 1, 72, 2);
				type600 = player:GetQuests():GetType(600);
				type600:ChangeTotalRound(1)
			else
				type600:ChangeTotalRound(1)
			end
	  end
		if player:HasBuff(246) then
			local Buff246 = player:FindBuff(246)
			local Buff246CoolDown = Buff246:GetBuffCoolDown() 
			if Buff246CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				NewBuff246CoolDown = (Buff246CoolDown + 3600) /60;
				player:AddBuff(246, 0, 0, 0, NewBuff246CoolDown, 100)
				if type601 == nil then
					player:GetQuests():SetRoundInfo(601, 1, 72, 2);
					type601 = player:GetQuests():GetType(601);
					type601:ChangeTotalRound(1)
				else
					type601:ChangeTotalRound(1)
				end		
			end
		else
			player:AddBuff(246, 0, 0, 0, 60, 100)
			if type601 == nil then
				player:GetQuests():SetRoundInfo(601, 1, 72, 2);
				type601 = player:GetQuests():GetType(601);
				type601:ChangeTotalRound(1)
			else
				type601:ChangeTotalRound(1)
			end
	  end

  elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
    
		
	
		if TotalRound600 >= 72 then
			ShowHint("本周使用次数已达到上限。")
			return
		end
		if player:HasBuff(218) then
			local Buff218 = player:FindBuff(218)
			local Buff218CoolDown = Buff218:GetBuffCoolDown() 
			if Buff218CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				ShowHint("成功领取2小时双倍经验")
				NewBuff218CoolDown = (Buff218CoolDown + 7200) /60;
				player:AddBuff(218, 0, 0, 0, NewBuff218CoolDown, 100)
		
				if type600 == nil then
					player:GetQuests():SetRoundInfo(600, 1, 72, 2);
					type600 = player:GetQuests():GetType(600);
					type600:ChangeTotalRound(1)
				else
					type600:ChangeTotalRound(1)
				end	
			end
		else
			ShowHint("成功领取2小时双倍经验")
			player:AddBuff(218, 0, 0, 0, 120, 100)
			if type600 == nil then
				player:GetQuests():SetRoundInfo(600, 1, 72, 2);
				type600 = player:GetQuests():GetType(600);
				type600:ChangeTotalRound(1)
			else
				type600:ChangeTotalRound(1)
			end
	  end
		if player:HasBuff(246) then
			local Buff246 = player:FindBuff(246)
			local Buff246CoolDown = Buff246:GetBuffCoolDown() 
			if Buff246CoolDown > 10800 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				NewBuff246CoolDown = (Buff246CoolDown + 7200) /60;
				player:AddBuff(246, 0, 0, 0, NewBuff246CoolDown, 100)
				if type601 == nil then
					player:GetQuests():SetRoundInfo(601, 1, 72, 2);
					type601 = player:GetQuests():GetType(601);
					type601:ChangeTotalRound(1)
				else
					type601:ChangeTotalRound(1)
				end		
			end
		else
			player:AddBuff(246, 0, 0, 0, 120, 100)
			if type601 == nil then
				player:GetQuests():SetRoundInfo(601, 1, 72, 2);
				type601 = player:GetQuests():GetType(601);
				type601:ChangeTotalRound(1)
			else
				type601:ChangeTotalRound(1)
			end
	  end
  elseif GetAnswer() == 3 and bProcess then
    script:SetSaying(true)
    
		
	
	
		if TotalRound600 >= 72 then
			ShowHint("本周使用次数已达到上限。")
			return
		end
		if player:HasBuff(218) then
			local Buff218 = player:FindBuff(218)
			local Buff218CoolDown = Buff218:GetBuffCoolDown() 
			if Buff218CoolDown > 72400 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				ShowHint("成功领取2小时双倍经验")
				NewBuff218CoolDown = (Buff218CoolDown + 72400) /60;
				player:AddBuff(218, 0, 0, 0, NewBuff218CoolDown, 100)
		
				if type600 == nil then
					player:GetQuests():SetRoundInfo(600, 1, 72, 2);
					type600 = player:GetQuests():GetType(600);
					type600:ChangeTotalRound(1)
				else
					type600:ChangeTotalRound(1)
				end	
			end
		else
			ShowHint("成功领取2小时双倍经验")
			player:AddBuff(218, 0, 0, 0, 240, 100)
			if type600 == nil then
				player:GetQuests():SetRoundInfo(600, 1, 72, 2);
				type600 = player:GetQuests():GetType(600);
				type600:ChangeTotalRound(1)
			else
				type600:ChangeTotalRound(1)
			end
	  end
		
		if player:HasBuff(246) then
			local Buff246 = player:FindBuff(246)
			local Buff246CoolDown = Buff246:GetBuffCoolDown() 
			if Buff246CoolDown > 72400 then
				ShowHint("双倍经验的叠加时间不得超过4小时")
			else
				NewBuff246CoolDown = (Buff246CoolDown + 72400) /60;
				player:AddBuff(246, 0, 0, 0, NewBuff246CoolDown, 100)
				if type601 == nil then
					player:GetQuests():SetRoundInfo(601, 1, 72, 2);
					type601 = player:GetQuests():GetType(601);
					type601:ChangeTotalRound(1)
				else
					type601:ChangeTotalRound(1)
				end		
			end
		else
			player:AddBuff(246, 0, 0, 0, 240, 100)
			if type601 == nil then
				player:GetQuests():SetRoundInfo(601, 1, 72, 2);
				type601 = player:GetQuests():GetType(601);
				type601:ChangeTotalRound(1)
			else
				type601:ChangeTotalRound(1)
			end
	  end
	elseif GetAnswer() == 4 then
	  NpcSay("每周玩家可获得72小时的双倍时间,每周00:00点后会刷新双倍时间\r请注意:#Y双倍时间领取以后不能冻结,请妥善领取双倍时间！")
	end
end

end
end

      
      
      

      






























-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00353)
