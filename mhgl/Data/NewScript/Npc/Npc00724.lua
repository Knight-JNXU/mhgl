-- Decompiled using luadec 2.0.2 by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\MHServer\Data\NewScript\Npc\Npc00724.out 

Preload("Quest55101.lua")
Preload("Quest55101.lua")
Preload("Quest55101.lua")
Preload("Quest80006.lua")
Npc000724 = {							-- 饭跑跑
	npc_id = 724,						-- NPC ID
	name = GetNpcName(724),				-- NPC 名称
	quests = { Quest55101,Quest80006 }				-- NPC 会派出的任务表
}

function Npc000724:Talk(bProcess)
  if player:HasGuild() == false then
    NpcSay("你这家伙是哪里跑进来的？")
    return 
  end
  local Guild = player:GetGuild()
  NpcAsk("帮派的发展是要考大家的努力。当前帮贡奖励基数：30点")
  SetAnswer(1, "建设任务（支持帮贡翻倍道具）")
  SetAnswer(2, "查看当前建设进度")
	SetAnswer(3, "我要提取本帮资金")
	SetAnswer(4, "回收帮派资金")	
	SetAnswer(5, "购买奇珍")  
   SetAnswer(6, "更改山庄繁荣度（需要帮派资金）")
  SetAnswer(13, "离开")
  WaitAnswer(13)
  if GetAnswer() == 1 then
    if Guild:GetBuildSwitch() == 0 then
      NpcSay("现在山庄没有建设中的建筑。")
    else
      local GuildId = player:GetGuildUid()
      local Year = LuaI.GetRealYear(LuaI.GetServiceTime())
      local Mon = LuaI.GetRealMonth(LuaI.GetServiceTime())
      local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
      local WDay = LuaI.GetRealWDay(LuaI.GetServiceTime())
      local QuestsTemp = GetGlobalNpcFlag(773, GuildId, 1)
      local ProYear = GetGlobalNpcFlag(773, GuildId, 2)
      local ProMon = GetGlobalNpcFlag(773, GuildId, 3)
      local ProDay = GetGlobalNpcFlag(773, GuildId, 4)
      local ProWDay = GetGlobalNpcFlag(773, GuildId, 5)
      if Year == ProYear then
        if WDay < ProWDay then
          SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
          SetGlobalNpcFlag(773, GuildId, 1, 0)
          SetGlobalNpcFlag(773, GuildId, 6, 0)
          SetGlobalNpcFlag(773, GuildId, 7, 0)
          SetGlobalNpcFlag(773, GuildId, 2, Year)
          SetGlobalNpcFlag(773, GuildId, 3, Mon)
          SetGlobalNpcFlag(773, GuildId, 4, Day)
          SetGlobalNpcFlag(773, GuildId, 5, WDay)
         -- DECOMPILER ERROR: unhandled construct in 'if'

        elseif Day - ProDay > 0 and Day - ProDay >= 7 then
          SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
          SetGlobalNpcFlag(773, GuildId, 1, 0)
          SetGlobalNpcFlag(773, GuildId, 6, 0)
          SetGlobalNpcFlag(773, GuildId, 7, 0)
          SetGlobalNpcFlag(773, GuildId, 2, Year)
          SetGlobalNpcFlag(773, GuildId, 3, Mon)
          SetGlobalNpcFlag(773, GuildId, 4, Day)
          SetGlobalNpcFlag(773, GuildId, 5, WDay)
          do return end
          if Day - ProDay < 0 then
            if Mon - ProMon > 1 then
              SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
              SetGlobalNpcFlag(773, GuildId, 1, 0)
              SetGlobalNpcFlag(773, GuildId, 6, 0)
              SetGlobalNpcFlag(773, GuildId, 7, 0)
              SetGlobalNpcFlag(773, GuildId, 2, Year)
              SetGlobalNpcFlag(773, GuildId, 3, Mon)
              SetGlobalNpcFlag(773, GuildId, 4, Day)
              SetGlobalNpcFlag(773, GuildId, 5, WDay)
             -- DECOMPILER ERROR: unhandled construct in 'if'

            elseif (Mon == 2 or Mon == 4 or Mon == 6 or Mon == 8 or Mon == 9 or Mon == 11) and ProDay + 31 - Day >= 7 then
              SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
              SetGlobalNpcFlag(773, GuildId, 1, 0)
              SetGlobalNpcFlag(773, GuildId, 6, 0)
              SetGlobalNpcFlag(773, GuildId, 7, 0)
              SetGlobalNpcFlag(773, GuildId, 2, Year)
              SetGlobalNpcFlag(773, GuildId, 3, Mon)
              SetGlobalNpcFlag(773, GuildId, 4, Day)
              SetGlobalNpcFlag(773, GuildId, 5, WDay)
              do return end
               -- DECOMPILER ERROR: unhandled construct in 'if'

              if (Mon == 5 or Mon == 7 or Mon == 12) and ProDay + 30 - Day >= 7 then
                SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                SetGlobalNpcFlag(773, GuildId, 1, 0)
                SetGlobalNpcFlag(773, GuildId, 6, 0)
                SetGlobalNpcFlag(773, GuildId, 7, 0)
                SetGlobalNpcFlag(773, GuildId, 2, Year)
                SetGlobalNpcFlag(773, GuildId, 3, Mon)
                SetGlobalNpcFlag(773, GuildId, 4, Day)
                SetGlobalNpcFlag(773, GuildId, 5, WDay)
                do return end
                 -- DECOMPILER ERROR: unhandled construct in 'if'

                 -- DECOMPILER ERROR: unhandled construct in 'if'

                 -- DECOMPILER ERROR: unhandled construct in 'if'

                if Mon == 3 and Year % 100 ~= 0 and Year % 4 == 0 and ProDay + 29 - Day >= 7 then
                  SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                  SetGlobalNpcFlag(773, GuildId, 1, 0)
                  SetGlobalNpcFlag(773, GuildId, 6, 0)
                  SetGlobalNpcFlag(773, GuildId, 7, 0)
                  SetGlobalNpcFlag(773, GuildId, 2, Year)
                  SetGlobalNpcFlag(773, GuildId, 3, Mon)
                  SetGlobalNpcFlag(773, GuildId, 4, Day)
                  SetGlobalNpcFlag(773, GuildId, 5, WDay)
                  do return end
                  if ProDay + 28 - Day >= 7 then
                    SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                    SetGlobalNpcFlag(773, GuildId, 1, 0)
                    SetGlobalNpcFlag(773, GuildId, 6, 0)
                    SetGlobalNpcFlag(773, GuildId, 7, 0)
                    SetGlobalNpcFlag(773, GuildId, 2, Year)
                    SetGlobalNpcFlag(773, GuildId, 3, Mon)
                    SetGlobalNpcFlag(773, GuildId, 4, Day)
                    SetGlobalNpcFlag(773, GuildId, 5, WDay)
                    do return end
                     -- DECOMPILER ERROR: unhandled construct in 'if'

                    if Year % 400 == 0 and ProDay + 29 - Day >= 7 then
                      SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                      SetGlobalNpcFlag(773, GuildId, 1, 0)
                      SetGlobalNpcFlag(773, GuildId, 6, 0)
                      SetGlobalNpcFlag(773, GuildId, 7, 0)
                      SetGlobalNpcFlag(773, GuildId, 2, Year)
                      SetGlobalNpcFlag(773, GuildId, 3, Mon)
                      SetGlobalNpcFlag(773, GuildId, 4, Day)
                      SetGlobalNpcFlag(773, GuildId, 5, WDay)
                      do return end
                      if ProDay + 28 - Day >= 7 then
                        SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                        SetGlobalNpcFlag(773, GuildId, 1, 0)
                        SetGlobalNpcFlag(773, GuildId, 6, 0)
                        SetGlobalNpcFlag(773, GuildId, 7, 0)
                        SetGlobalNpcFlag(773, GuildId, 2, Year)
                        SetGlobalNpcFlag(773, GuildId, 3, Mon)
                        SetGlobalNpcFlag(773, GuildId, 4, Day)
                        SetGlobalNpcFlag(773, GuildId, 5, WDay)
                      elseif Mon >= 2 then
                        SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                        SetGlobalNpcFlag(773, GuildId, 1, 0)
                        SetGlobalNpcFlag(773, GuildId, 6, 0)
                        SetGlobalNpcFlag(773, GuildId, 7, 0)
                        SetGlobalNpcFlag(773, GuildId, 2, Year)
                        SetGlobalNpcFlag(773, GuildId, 3, Mon)
                        SetGlobalNpcFlag(773, GuildId, 4, Day)
                        SetGlobalNpcFlag(773, GuildId, 5, WDay)
                      elseif Mon == 1 and ProDay + 31 - Day >= 7 then
                        SetGlobalNpcFlag(773, GuildId, 0, QuestsTemp)
                        SetGlobalNpcFlag(773, GuildId, 1, 0)
                        SetGlobalNpcFlag(773, GuildId, 6, 0)
                        SetGlobalNpcFlag(773, GuildId, 7, 0)
                        SetGlobalNpcFlag(773, GuildId, 2, Year)
                        SetGlobalNpcFlag(773, GuildId, 3, Mon)
                        SetGlobalNpcFlag(773, GuildId, 4, Day)
                        SetGlobalNpcFlag(773, GuildId, 5, WDay)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      if HasQuest(55101) then
        Quest55101:Return()
      else
        if HasQuest(55102) then
          Quest55101:Return()
        else
          if HasQuest(55104) then
            Quest55101:Return()
          else
            local r = math.random(1, 3)
            if r == 1 then
              Quest55101:Take()
            elseif r == 2 then
              Quest55101:Take()
            elseif r == 3 then
              Quest55101:Take()
            else

            end
          end
        end
      end
    end
  end
                if GetAnswer() == 2 then
                local Msg = "无"
                local Type = Guild:GetBuildSwitch()
                local Lv = 1
                local Total = 0
                if Type == 1 then
                  Msg = "书院"
                  Lv = Guild:GetCollege()
                  local A = 100
                  if Lv >= 8 and Lv < 12 then
                    A = 100 + 5 * (Lv - 7)
                  elseif Lv >= 12 and Lv < 16 then
                    A = 120 + 10 * (Lv - 11)
                  elseif Lv >= 16 then
                    A = 160 + 20 * (Lv - 15)
                  end
                  Total = 20 + (A) * (Lv + 1) / 3
                elseif Type == 2 then
                  Msg = "厢房"
                  Lv = Guild:GetRoom()
                  local A = 100
                  if Lv >= 8 and Lv < 12 then
                    A = 100 + 5 * (Lv - 7)
                  elseif Lv >= 12 and Lv < 16 then
                    A = 120 + 10 * (Lv - 11)
                  elseif Lv >= 16 then
                    A = 160 + 20 * (Lv - 15)
                  end
                  Total = 20 + (A) * (Lv + 1) / 3
                elseif Type == 3 then
                  Msg = "金库"
                  Lv = Guild:GetCoffers()
                  local A = 100
                  if Lv >= 8 and Lv < 12 then
                    A = 100 + 5 * (Lv - 7)
                  elseif Lv >= 12 and Lv < 16 then
                    A = 120 + 10 * (Lv - 11)
                  elseif Lv >= 16 then
                    A = 160 + 20 * (Lv - 15)
                  end
                  Total = 20 + (A) * (Lv + 1) / 3
                elseif Type == 4 then
                  Msg = "四相房"
                  Lv = Guild:GetElement()
                  local A = 100
                  if Lv >= 8 and Lv < 12 then
                    A = 100 + 5 * (Lv - 7)
                  elseif Lv >= 12 and Lv < 16 then
                    A = 120 + 10 * (Lv - 11)
                  elseif Lv >= 16 then
                    A = 160 + 20 * (Lv - 15)
                  end
                  Total = 20 + (A) * (Lv + 1) / 3
                elseif Type == 5 then
                  Msg = "福利房"
                  Lv = Guild:GetBoon()
                  local A = 100
                  if Lv >= 8 and Lv < 12 then
                    A = 100 + 5 * (Lv - 7)
                  elseif Lv >= 12 and Lv < 16 then
                    A = 120 + 10 * (Lv - 11)
                  elseif Lv >= 16 then
                    A = 160 + 20 * (Lv - 15)
                  end
                  Total = 20 + (A) * (Lv + 1) / 3
                elseif Type == 6 then
                  Msg = "修炼房"
                  Lv = Guild:GetTrain()
                  local A = 100
                  if Lv >= 2 and Lv < 3 then
                    A = 105
                  elseif Lv >= 3 and Lv < 4 then
                    A = 130
                  elseif Lv >= 4 then
                    A = 180
                  end
                  Total = 100 + A * 5 * (4 * Lv + 1) / 3
                elseif Type == 7 then
                  Msg = "山庄规模"
                  Lv = Guild:GetManorScale()
                  local A = 100
                  if Lv >= 2 and Lv < 3 then
                    A = 105
                  elseif Lv >= 3 and Lv < 4 then
                    A = 130
                  elseif Lv >= 4 then
                    A = 180
                  end
                  Total = 200 + A * 10 * (4 * Lv + 1) / 3
                end
                NpcSay(string.format("当前建设中的#P%s#W建筑进度为#G%d#W/#G%d#W。", Msg, Guild:GetBuildProcess(), Total))
              
		elseif GetAnswer() == 3 then	
	--[[local A = math.random(1,10)
	  if A <= 5 then
		  if not bProcess then
				player:AntiHack()
			end
	  end--]]
		if player:GetQuests():HasQuest(80001) then
			Quest80001:Return()
			return
		end		
		if player:GetQuests():HasQuest(80002) then
			Quest80002:Return()
			return
		end
		if player:GetQuests():HasQuest(80003) then
			Quest80003:Return()
			return
		end			
		if player:GetQuests():HasQuest(80006) then
			Quest80006:Return()
			return
		end	 				

		if player:GetQuests():GetType(800) and player:GetQuests():GetType(800):GetLimitRound() == 8 then
			player:GetQuests():RemoveType(800)
		end
		NpcAsk("每天只能提取一次，帮派资金必须大于5000W才能进行提取！只有帮主才能提取！")	
		SetAnswer(1, "我是帮主")
		--SetAnswer(2, "高效跑商")
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			player:GetQuests():SetFlag(800,2)
		elseif GetAnswer() == 2 then
			player:GetQuests():SetFlag(800,1)
		else
			return
		end

	if player:GetLevel() < 180 then
			Quest80006:Take()
		end	
	elseif GetAnswer() == 4 then
		if player:GetQuests():HasQuest(80006) then
			NpcAsk("你确定将多余的帮派资金注入本帮吗？")	
			SetAnswer(1, "是")
			SetAnswer(2, "否")
			WaitAnswer(2)		
			if GetAnswer() == 1 then
				if IsProcess() then	
					script:SetSaying(true)		
					player:GetQuests():RemoveQuest(80006)
					player:RemoveBuff(277)
					player:GetItems():RemoveAllBusinessItem()
					player:GetQuests():SetTimeMark(800)
					NpcSay("已注入。")			
				end
			end
		else
		    NpcSay("你的身上没有帮派资金。")
		end	
	elseif GetAnswer() == 5 then	
		if player:GetGuild() == nil then
			NpcSay("我们不和来历不明的人通商。")
			return false
		end		
		if player:GetGuildPos() == 1 then				
			if player:GetQuests():HasQuest(80006) then	
			  local A = math.random(1,50)
			  if A <= 2 then 
			    if not bProcess then
			      player:AntiHack()
			    end
			  else
			    player:OpenBusinessShop(11)
			  end
			else				
				NpcSay("你连帮派银票都没带在身上，这让我怎么和你进行贸易往来？")
			end		
		else
		    NpcSay("我只与帮主交谈。")
			end
	end		
	  if GetAnswer() == 6 then
     NpcAsk("需要更改多少？需要消耗帮派资金")
     SetAnswer(1, "增加10（需要10000银两）")
     SetAnswer(2, "增加100（需要100000银两）")
     SetAnswer(3, "增加1000（需要1000000银两）")
     SetAnswer(4, "五级规模")	 
     SetAnswer(14, "离开")
     WaitAnswer(14)
     local guild = player:GetGuild()
           if GetAnswer() == 1 then
              if IsProcess then
              guild:ChangeProsper(10)
			end
			guild:ChangeFund(-10000)
			  ShowError("帮派繁荣增加10点")	
           elseif GetAnswer() == 2 then
              if IsProcess then
              guild:ChangeProsper(100)
			end
			guild:ChangeFund(-100000)			
			  ShowError("帮派繁荣增加100点")	
           elseif GetAnswer() == 3 then
              if IsProcess then
              guild:ChangeProsper(1000)
			end
			guild:ChangeFund(-1000000)
			  ShowError("帮派繁荣增加1000点")	
		   end	
           elseif GetAnswer() == 4 then
		        if IsProcess then
			guild:SetNewManorScale(5)
		end	   
end
end
AddNpcTable(Npc000724)
