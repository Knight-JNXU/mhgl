-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Npc\NPC00336.out 

Npc000336 = {npc_id = 336, name = GetNpcName(336)}
Npc000336.Talk = function(self, bProcess)
  NpcAsk("武林中人无不渴望扬名于英雄大会。")
  SetAnswer(1, "我要报名英雄大会")
  SetAnswer(2, "进入英雄会场地")
  SetAnswer(3, "英雄大会规则介绍")
  SetAnswer(4, "查询英雄大会个人积分")
  SetAnswer(5, "查询英雄大会队伍积分")
  SetAnswer(6, "领取奖励")
  SetAnswer(7, "领取积分称谓")
  SetAnswer(8, "查询我的分组情况")
  SetAnswer(9, "领取报名补偿")
  SetAnswer(10, "离开")
  WaitAnswer(10)
    if GetAnswer() == 1 then
        local Day = LuaI.GetRealDay()
        local wDay = LuaI.GetRealWDay()
        local hour = LuaI.GetRealHour()
        if wDay >= 6 and hour >= 13 then
           NpcSay("现在不是报名时间。")
           return
        end
        if player:GetSingleWarGroup() > 0 then
           NpcSay("你已经报名了。")
	       return
	    end
        if player:GetMoney() < player:GetLevel() * 20000 then
           NpcSay(string.format("报名费用不足%d。", player:GetLevel() * 20000))
           return
	    end
        if player:GetLevel() < 50 then
           NpcSay("你不够50级")
           return
	    end
        if player:GetPK_Value() > 0 then
           NpcSay("PK值大于0的玩家无法报名。")
           return
	    end
        player:ChangeMoney(-player:GetLevel() * 200, 13017)
        player:GetQuests():SetFlag(603, player:GetLevel())
        player:ChangeSingleWarGroup(255)
        local level = player:GetLevel()
        if level < 70 then
           NpcSay("报名成功，你已报名参加#P崭露头角#W级别的英雄大会。英雄会一共分两天进行，分别将于每周六、周日的14：00开始，英雄会前半小时可以提前进入英雄会场地。")
        elseif level < 90 then
           NpcSay("报名成功，你已报名参加#P出类拔萃#W级别的英雄大会。英雄会一共分两天进行，分别将于每周六、周日的14：00开始，英雄会前半小时可以提前进入英雄会场地。")
        elseif level < 110 then
           NpcSay("报名成功，你已报名参加#P纵横江湖#W级别的英雄大会。英雄会一共分两天进行，分别将于每周六、周日的14：00开始，英雄会前半小时可以提前进入英雄会场地。")
        elseif level < 120 then
           NpcSay("报名成功，你已报名参加#P扬名立万#W级别的英雄大会。英雄会一共分两天进行，分别将于每周六、周日的14：00开始，英雄会前半小时可以提前进入英雄会场地。")
        elseif level <= 140 then
           NpcSay("报名成功，你已报名参加#P天外飞仙#W级别的英雄大会。英雄会一共分两天进行，分别将于每周六、周日的14：00开始，英雄会前半小时可以提前进入英雄会场地。")
        end
        player:GetQuests():SetFlag(600, 0)
        player:GetQuests():SetFlag(601, 0)
        player:GetQuests():SetFlag(602, 0)
		-- 第一个选项结束
    elseif GetAnswer() == 2 and bProcess then
	          script:SetSaying(true)
              local group = player:GetSingleWarGroup()
              local level = player:GetLevel()
              if group == 0 then
                NpcSay("报名册上没有你的名字。")
                return 
			  end
			  if group == 255 then
                NpcSay("天下英雄会还没开始。")
                return 
              end
              if group == 254 then
                if level < 70 then
                  NpcSay("由于#P崭露头角#W级别报名人数不足4人，本次英雄大会该组比试已经取消，请在我这里领取补偿吧。")
                elseif level < 90 then
                  NpcSay("由于#P出类拔萃#W级别报名人数不足4人，本次英雄大会该组比试已经取消，请在我这里领取补偿吧。")
                elseif level < 110 then
                  NpcSay("由于#P纵横江湖#W级别报名人数不足4人，本次英雄大会该组比试已经取消，请在我这里领取补偿吧。")
                elseif level < 120 then
                  NpcSay("由于#P扬名立万#W级别报名人数不足4人，本次英雄大会该组比试已经取消，请在我这里领取补偿吧。")
                elseif level < 140 then
                  NpcSay("由于#P天外飞仙#W级别报名人数不足4人，本次英雄大会该组比试已经取消，请在我这里领取补偿吧。")
                end
				return
			  end
            local PrepareTips = LuaI.GetSingleWarPrepareTips()
            if PrepareTips == 0 then
              NpcSay("现在还没到进场时间。")
              return 
			end
            if player:GetPK_Value() > 0 then
                NpcSay("PK值大于0的玩家无法进场。")
                return 
            end
            if party then
              NpcSay("请离开队伍后再进场。")
              return 
            end
            if player:GetMap():GetLine_id() ~= 1 then
              NpcSay("请在#G1#W线进场。")
              return
            end
            if HasQuest(30601) or HasQuest(30602) or HasQuest(30603) or HasQuest(30604) or HasQuest(30605) then
              NpcSay("跑镖任务未完成无法进场。")
              return
            end
            if level < 50 then
              NpcSay("你不够50级")
              return 
			end
            local level = player:GetLevel()
            local levelGroup = 0
            if level < 70 then
              levelGroup = 0
            elseif level < 90 then
              levelGroup = 1
            elseif level < 110 then
              levelGroup = 2
            elseif level < 120 then
              levelGroup = 3
            elseif level < 140 then
              levelGroup = 4
            end
            local wDay = LuaI.GetRealWDay()
            local hour = LuaI.GetRealHour()
            local minute = LuaI.GetRealMinute()
        if PrepareTips < 4 then
            if wDay == 6 and hour == 13 and minute >= 30 then
                if group == 1 then
                   player:ChangeSingleWarVSGroup(2)
                    if levelGroup == 0 then
                       player:JumpMap(56600, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56620, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56630, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56640, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56650, 31, 116)					
					end
                elseif group == 2 then
                   player:ChangeSingleWarVSGroup(1)
                    if levelGroup == 0 then
                       player:JumpMap(56600, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56620, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56630, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56640, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56650, 31, 116)	
					end
                elseif group == 3 then
                   player:ChangeSingleWarVSGroup(4)
                    if levelGroup == 0 then
                       player:JumpMap(56601, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56621, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56631, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56641, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56651, 31, 116)
					end
                elseif group == 4 then
                   player:ChangeSingleWarVSGroup(3)
                    if levelGroup == 0 then
                       player:JumpMap(56601, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56621, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56631, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56641, 31, 116)
                    elseif levelGroup == 4 then
					   player:JumpMap(56651, 31, 116)
					end
				end
			else
				NpcSay("举行英雄会的周六、周日的13：30~14：00和15：30~16：00才能进入英雄会场地。")
			end
        elseif PrepareTips < 7 then
            if wDay == 6 and hour == 15 and minute >= 30 then
                if group == 1 then
                   player:ChangeSingleWarVSGroup(3)
                    if levelGroup == 0 then
                       player:JumpMap(56602, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56622, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56632, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56642, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56652, 31, 116)
					end
                elseif group == 2 then
                   player:ChangeSingleWarVSGroup(4)
                    if levelGroup == 0 then
                       player:JumpMap(56603, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56623, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56633, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56643, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56653, 31, 116)
                    end
                elseif group == 3 then
                   player:ChangeSingleWarVSGroup(1)
                    if levelGroup == 0 then
                       player:JumpMap(56602, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56622, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56632, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56642, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56652, 31, 116)
					end
				elseif group == 4 then
                   player:ChangeSingleWarVSGroup(2)
                    if levelGroup == 0 then
                       player:JumpMap(56603, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56623, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56633, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56643, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56653, 31, 116)
					end
				end
			else
                NpcSay("举行英雄会的周六、周日的13：30~14：00和15：30~16：00才能进入英雄会场地。")
            end
        elseif PrepareTips < 10 then
            if wDay == 0 and hour == 13 and minute >= 30 then
                if group == 1 then
                   player:ChangeSingleWarVSGroup(4)
                    if levelGroup == 0 then
                       player:JumpMap(56600, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56620, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56630, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56640, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56650, 31, 116)
					end
                elseif group == 2 then
                   player:ChangeSingleWarVSGroup(3)
                    if levelGroup == 0 then
                       player:JumpMap(56601, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56621, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56631, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56641, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56651, 31, 116)
					end
                elseif group == 3 then
                   player:ChangeSingleWarVSGroup(2)
                    if levelGroup == 0 then
                       player:JumpMap(56601, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56621, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56631, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56641, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56651, 31, 116)
					end
			    elseif group == 4 then
                   player:ChangeSingleWarVSGroup(1)
                    if levelGroup == 0 then
                       player:JumpMap(56600, 31, 116)
                    elseif levelGroup == 1 then
                       player:JumpMap(56620, 31, 116)
                    elseif levelGroup == 2 then
                       player:JumpMap(56630, 31, 116)
                    elseif levelGroup == 3 then
                       player:JumpMap(56640, 31, 116)
                    elseif levelGroup == 4 then
                       player:JumpMap(56650, 31, 116)
					end
				end
			else
                NpcSay("举行英雄会的周六、周日的13：30~14：00和15：30~16：00才能进入英雄会场地。")
            end
        elseif wDay == 0 and hour == 15 and minute >= 30 then
            local VSgroup = LuaI.GetSingleWarVSGroup(levelGroup, group)
            player:ChangeSingleWarVSGroup(VSgroup)
            local rank = LuaI.GetSingleWarGroupRank(levelGroup, group)
            if rank <= 1 then
                if levelGroup == 0 then
                   player:JumpMap(56602, 31, 116)
                elseif levelGroup == 1 then
                   player:JumpMap(56622, 31, 116)
                elseif levelGroup == 2 then
                   player:JumpMap(56632, 31, 116)
                elseif levelGroup == 3 then
                   player:JumpMap(56642, 31, 116)
                elseif levelGroup == 4 then
                   player:JumpMap(56652, 31, 116)
				end
			else
                if levelGroup == 0 then
                   player:JumpMap(56603, 31, 116)
                elseif levelGroup == 1 then
                   player:JumpMap(56623, 31, 116)
                elseif levelGroup == 2 then
                   player:JumpMap(56633, 31, 116)
                elseif levelGroup == 3 then
                   player:JumpMap(56643, 31, 116)
                elseif levelGroup == 4 then
                   player:JumpMap(56653, 31, 116)
				end
			end
		else
            NpcSay("举行英雄会的周六、周日的13：30~14：00和15：30~16：00才能进入英雄会场地。")
			return
        end
          player:GetQuests():RemoveFlag(615)
          LuaI.EnterSingleWarMap(levelGroup, player)
		--第二个选项结束
    elseif GetAnswer() == 3 then
                NpcAsk("英雄大会规则介绍")
                SetAnswer(1, "关于英雄大会")
                SetAnswer(2, "如何报名")
                SetAnswer(3, "如何分组")
                SetAnswer(4, "英雄会规则")
                SetAnswer(5, "积分规则")
                SetAnswer(6, "英雄会奖励")
                SetAnswer(7, "我都了解了")
                WaitAnswer(7)
                if GetAnswer() == 1 then
                   NpcSay("英雄大会将于每个周末举行，各方大侠分组捉对比试，决出最后的胜利者会有丰厚的奖励。")
                elseif GetAnswer() == 2 then
                   NpcSay("英雄会一共分两天进行，分组确定以后就无法报名，直至本次英雄会完全结束以后才能进行下一次英雄会的报名。")
                elseif GetAnswer() == 3 then
                   NpcSay("根据玩家报名时候的等级会自动分配到不同组别。50~69为崭露头角组，70~89为出类拔萃组，90~109为纵横江湖组，110-140为扬名立万组，121-140为天外飞仙组。同一组别又随即分配为四个不同的队伍，即寻欢、小凤、留香、晓锋四队。")
                elseif GetAnswer() == 4 then
                   NpcSay("英雄大会一共举行两天四场英雄会。前三场英雄会各组别的四个大组进行循环积分赛，积分最高的两个大组进行最后的冠军争夺赛决出冠军。英雄大会中，只要战斗结束时处于“死亡状态”，在战斗后均会被逐出场地，并且无法进入场地参加该轮的英雄会。")
                elseif GetAnswer() == 5 then
                   NpcAsk("英雄大会有个人积分和队伍积分两种。")
                   SetAnswer(1, "了解个人积分")
                   SetAnswer(2, "了解队伍积分")
                   WaitAnswer(2)
                    if GetAnswer() == 1 then
                       NpcSay("每个玩家参加一场英雄会战斗无论胜负都能获得一定积分。积分的多少取决于英雄会双方的人数、等级、胜负关系以及所用的回合数。以弱胜强是可以获得更多积分的。")
                    elseif GetAnswer() == 2 then
                       NpcSay("各个队伍取胜所用时间越短，获得积分越多。\r30分钟内取胜积分+6\r45分钟内取胜积分+5\r60分钟内取胜积分+4\r75分钟内取胜积分+3\r90分钟内取胜积分+2\r若90分钟内不分胜负则根据以下条件依次判断胜利方，并+1分：\r1.在场人数较多一方为胜利\r2.在场人数的等级和较低一方\r3.总经验较少一方胜利\r4.随机抽取胜利一方")
                       NpcSay("队伍积分是决定最后冠军争夺资格的唯一因素。")
                    end
                elseif GetAnswer() == 6 then
                   NpcSay("每届英雄大会结束后，会在获得冠军的队伍中取积分前3名的玩家分别奖励“状元”、“榜眼”、“探花”称谓以及丰厚的物品奖励，冠军组的其他队员均有丰富的经验和金钱奖励。所有参加英雄会的玩家无论胜负均会获得不等的英雄会积分，英雄会积分可以在我这里换取一些物品道具奖励。")
                end
				--第三个选项结束
    elseif GetAnswer() == 4 and bProcess then
               player:ShowRank(10)
    elseif GetAnswer() == 5 and bProcess then
               player:OpenSingleWarGroupScore()
    elseif GetAnswer() == 6 then
               local personRank = player:GetSingleWarPersonRank()
               local personRankLevel = math.floor(personRank / 10)
               NpcAsk("请问需要领取什么奖励？")
               SetAnswer(1, "个人三甲奖励")
               SetAnswer(2, "冠军组奖励")
               SetAnswer(3, "参赛奖励")
               SetAnswer(4, "点错了")
               WaitAnswer(4)
                if GetAnswer() == 1 then			
                   local level = player:GetLevel()
                   local levelGroup = "无"
                    if level < 50 then
                       NpcSay("你不够50级")
                       return 
                    end
                   local SingleWarState = LuaI.GetSingleWarState()
                    if PrepareTips ~= 12 then
                       NpcSay("现在不是领取该奖励的时间。")
                       return 
                    end
                   local flag600 = player:GetQuests():GetFlag(600)
                    if flag600 ~= 0 then
                       NpcSay("你已经领取过奖励。")
                       return 
                    end
                    local personRankPosition = math.fmod(personRank, 10)
                    if personRankLevel == 0 then
                        if personRankPosition == 1 then
                            if player:GetItems():GetFreeSlot(0) < 3 then
                               NpcSay("请先清理一下你的当前背包，至少预留三个位置。")
                               return 
                            end
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(709)
                               player:GetItems():AddItem(402833, 1)
                             --  script:Rumor(string.format("%s #O获得了#A崭露头角·状元#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B5级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得崭露头角组状元。")
							end	
                        elseif personRankPosition == 2 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(710)
                               player:GetItems():AddItem(402833, 1)
                            --   script:Rumor(string.format("%s #O获得了#A崭露头角·榜眼#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B5级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得崭露头角组榜眼。")
							end
                        elseif personRankPosition == 3 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(711)
                               player:GetItems():AddItem(402833, 1)
                              -- script:Rumor(string.format("%s #O获得了#A崭露头角·探花#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B5级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得崭露头角组探花。")
							end							
                        else
                            NpcSay("你没有进入个人三甲。")
                        end
                    elseif personRankLevel == 1 then
                        if personRankPosition == 1 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(712)
                               player:GetItems():AddItem(402834, 1)
                              -- script:Rumor(string.format("%s #O获得了#A出类拔萃·状元#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得出类拔萃组状元。")
							end
                        elseif personRankPosition == 2 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(713)
                               player:GetItems():AddItem(402834, 1)
                             --  script:Rumor(string.format("%s #O获得了#A出类拔萃·榜眼#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得出类拔萃组榜眼。")
							end		
                        elseif personRankPosition == 3 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(714)
                               player:GetItems():AddItem(402834, 1)
                              -- script:Rumor(string.format("%s #O获得了#A出类拔萃·探花#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得出类拔萃组探花。")
							end										
                        else
                            NpcSay("你没有进入个人三甲。")
                        end
                    elseif personRankLevel == 2 then
                        if personRankPosition == 1 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(715)
                               player:GetItems():AddItem(402835, 1)
                           --    script:Rumor(string.format("%s #O获得了#A纵横江湖·状元#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得纵横江湖组状元。")
							end
                        elseif personRankPosition == 2 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(716)
                               player:GetItems():AddItem(402835, 1)
                            --   script:Rumor(string.format("%s #O获得了#A纵横江湖·榜眼#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得纵横江湖组榜眼。")
							end		
                        elseif personRankPosition == 3 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(717)
                               player:GetItems():AddItem(402835, 1)
                              -- script:Rumor(string.format("%s #O获得了#A纵横江湖·探花#O称号以及#B紫铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得纵横江湖组探花。")
							end										
                        else
                            NpcSay("你没有进入个人三甲。")
                        end
                    elseif personRankLevel == 3 then
                        if personRankPosition == 1 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(718)
                               player:GetItems():AddItem(402838, 1)
                             --  script:Rumor(string.format("%s #O获得了#A扬名立万·状元#O称号以及#B金铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得扬名立万组状元。")    
							end
                        elseif personRankPosition == 2 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(719)
                               player:GetItems():AddItem(402838, 25)
                           --    script:Rumor(string.format("%s #O获得了#A扬名立万·榜眼#O称号以及#B金铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得扬名立万组榜眼。")  
						    end
                        elseif personRankPosition == 3 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(720)
                               player:GetItems():AddItem(402838, 1)
                               --script:Rumor(string.format("%s #O获得了#A扬名立万·探花#O称号以及#B金铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得扬名立万组探花。")         
							end
                        else
                            NpcSay("你没有进入个人三甲。")
                        end
                    elseif personRankLevel == 4 then
                        if personRankPosition == 1 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(721)
                               player:GetItems():AddItem(402837, 1)
							   player:GetItems():AddItem(51394, 1)
							   player:GetItems():AddItem(51396, 1)							   
                              -- script:Rumor(string.format("%s #O获得了#A天外飞仙·状元#O称号以及#B金铁精英#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得天外飞仙组状元。")
                            end           
                        elseif personRankPosition == 2 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(722)
                               player:GetItems():AddItem(402837, 1)
							   player:GetItems():AddItem(51393, 2)
                              -- script:Rumor(string.format("%s #O获得了#A天外飞仙·榜眼#O称号以及#B金铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得天外飞仙组榜眼。")
							end
                        elseif personRankPosition == 3 then
                            if bProcess then
                               player:GetQuests():SetFlag(600, 1)
                               player:AddTitle(723)
                               player:GetItems():AddItem(402838, 1)
							   player:GetItems():AddItem(51395, 1)
                            --   script:Rumor(string.format("%s #O获得了#A天外飞仙·探花#O称号以及#B金铁#O、#B雷火神针•十一#O和#B6级抛光石#O的奖励。", player:GetCharNameLink()), false)
                               NpcSay("恭喜你获得天外飞仙组探花。") 
							end
                        else
                            NpcSay("你没有进入个人三甲。")
                        end
                    end
				elseif GetAnswer() == 2 then
                    local PrepareTips = LuaI.GetSingleWarPrepareTips()
                    if PrepareTips ~= 12 then
                       NpcSay("现在不是领取该奖励的时间。")
                       return 
                    end
                    local group = player:GetSingleWarGroup()
                    if group >= 1 and group <= 4 then
                       NpcSay("你好像没有参加本次英雄大会。")
                       return 
					end
                    local winGroup = LuaI.GetSingleWarGroupWin(personRankLevel)
                    if winGroup == 0 then
                       NpcSay("当前决战中，胜负未分，稍候再来。")
					return
					end
                    if winGroup ~= group then
                       NpcSay("很遗憾，你所在的队伍没有取得冠军。")
                       return 
					end
                    if player:GetItems():GetFreeSlot(0) < 2 then
                       ShowHint("请先清理一下你的当前背包，至少预留一两个位置")
                       return 
                    end
                    if bProcess then
                        if player:GetQuests():GetFlag(601) == 1 then
                           NpcSay("你已经领取过奖励。")
                        return 
                        end
                        local Level = player:GetLevel()
                        local Exp = (80 * Level + 10) * 6.6 * 70
                        local r = math.random(0, 99)
                        if personRankLevel == 0 then
                           levelGroup = "崭露头角组"
                           player:GetItems():AddItem(402832, 5)
                           ShowError("#W获得5000元宝票")
                            if r < 5 then
                               player:GetItems():AddItem(402833, 1)
                               ShowError("#W获得1W元宝票")
							end
                        elseif personRankLevel == 1 then
                               levelGroup = "出类拔萃组"
                               player:GetItems():AddItem(402832, 10)
                               ShowError("#W获得5000元宝票")
                            if r < 10 then
                               player:GetItems():AddItem(402833, 1)
                               ShowError("#W获得1W元宝票")
							end
                        elseif personRankLevel == 2 then
                               levelGroup = "纵横江湖组"
                               player:GetItems():AddItem(402832, 10)
                               ShowError("#W获得5000元宝票")
                            if r < 15 then
                               player:GetItems():AddItem(402833, 1)
                               ShowError("#W获得1W元宝票")
							end
                        elseif personRankLevel == 3 then
                               levelGroup = "扬名立万组"
                               player:GetItems():AddItem(402834, 5)
                               ShowError("#W获得2W元宝票")
                            if r < 20 then
                               player:GetItems():AddItem(402835, 1)
                               ShowError("#W获得3W元宝票")
							end
                        elseif personRankLevel == 4 then
                               levelGroup = "天外飞仙组"
                               player:GetItems():AddItem(402838, 10)
                               ShowError("#W获得5W元宝票")
                            if r < 20 then
                               player:GetItems():AddItem(402463, 1)
                               ShowError("#W获得成长丹")
                            end
						end
                    player:GetQuests():SetFlag(601, 1)
                    player:ChangeExp(Exp)
                    ShowError(string.format("#W获得经验值%d", Exp))
                    NpcSay(string.format("由于你所在的队伍获得本届英雄大会%s组冠军，你获得丰厚奖励。", levelGroup))
				    end
                elseif GetAnswer() == 3 then
                   local PrepareTips = LuaI.GetSingleWarPrepareTips()
                    if PrepareTips ~= 12 then
                       NpcSay("现在不是领取该奖励的时间")
                       return 
                    end
                   local group = player:GetSingleWarGroup()
                    if group >= 1 and group <= 4 then
                       NpcSay("你好像没有参加本次英雄大会。")
					   return
                    end
                   local winGroup = LuaI.GetSingleWarGroupWin(personRankLevel)
                    if winGroup == 0 then
                       NpcSay("当前决战中，胜负未分，稍候再来")
                       return 
					end
                    if winGroup ~= group then
                        if bProcess then
                           script:SetSaying(true)
                            if player:GetQuests():GetFlag(601) == 1 then
                               NpcSay("你已经领取过奖励。")
                               return 
                            end
                           local Level = player:GetLevel()
                           local Exp = (80 * Level + 10) * 6.6 * 70
                           player:GetQuests():SetFlag(601, 1)
                           player:ChangeExp(Exp)
                           player:GetItems():AddItem(41402, 1)
                            if math.random(0, 99) < 5 then
                               player:GetItems():AddItem(402838, 1)
                               ShowError("#W获得5W元宝票")
                            end
                           ShowError(string.format("#W获得经验值%d", Exp))
                           --ShowError("#W获得蓝铁精英")
                           NpcSay("由于你积极参加本届英雄大会，这是发给你的奖励。")
                        end
                    else
                       NpcSay("你所在的队伍取得了冠军，请领取冠军组奖励。")
                    end
				end
    elseif GetAnswer() == 7 then
               local totalpoint = player:GetSingleWarScoreTotal()
            if totalpoint > 0 and bProcess then
                if totalpoint > 100 and totalpoint <= 200 and bProcess then
                   player:AddTitle(724)
                elseif totalpoint > 200 and totalpoint <= 500 and bProcess then
                   player:AddTitle(725)
                   player:RemoveTitle(724)
                elseif totalpoint > 500 and totalpoint <= 1000 and bProcess then
                   player:AddTitle(726)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                elseif 1000 < totalpoint and totalpoint <= 2000 and bProcess then
                   player:AddTitle(727)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                   player:RemoveTitle(726)
                elseif 2000 < totalpoint and totalpoint <= 4000 and bProcess then
                   player:AddTitle(728)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                   player:RemoveTitle(726)
                   player:RemoveTitle(727)
                elseif 4000 < totalpoint and totalpoint <= 8000 and bProcess then
                   player:AddTitle(729)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                   player:RemoveTitle(726)
                   player:RemoveTitle(727)
                   player:RemoveTitle(728)
                elseif 8000 < totalpoint and totalpoint <= 16000 and bProcess then
                   player:AddTitle(730)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                   player:RemoveTitle(726)
                   player:RemoveTitle(727)
                   player:RemoveTitle(728)
                   player:RemoveTitle(729)
                elseif 16000 < totalpoint and bProcess then
                   player:AddTitle(729)
                   player:RemoveTitle(724)
                   player:RemoveTitle(725)
                   player:RemoveTitle(726)
                   player:RemoveTitle(727)
                   player:RemoveTitle(728)
                   player:RemoveTitle(729)
                   player:RemoveTitle(730)
                end
                NpcSay("称谓已发放，还请大侠再接再厉，争取更高荣誉。")
			else
                NpcSay("你没有参加任何活动，别瞎闹。")
			end		   
    elseif GetAnswer() == 8 then
               local group = player:GetSingleWarGroup()
               local level = player:GetLevel()
               local msgGroup = "无"
                if group == 254 then
                   NpcSay("你所报名的组别因人数不足4人而取消，请在我这里领取补偿吧。")
				return
                end
                if group == 0 then
                   msgGroup = "无"
                elseif group == 1 then
                   msgGroup = "寻欢队"
                elseif group == 2 then
                   msgGroup = "小凤队"
                elseif group == 3 then
                   msgGroup = "留香队"
                elseif group == 4 then
                   msgGroup = "晓锋队"
				end
                local levelGroup = "无"
                if level < 70 and 50 <= level then
                   levelGroup = "崭露头角组"
                elseif level < 90 then
                   levelGroup = "出类拔萃组"
                elseif level < 110 then
                   levelGroup = "纵横江湖组"
                elseif level < 120 then
                   levelGroup = "扬名立万组"
                elseif level < 140 then
                   levelGroup = "天外飞仙组"
                end
                if group == 255 then
                   NpcSay(string.format("你属于#Y%s  \\r        #G暂时没有小队\\r        #R英雄会日由系统自动分队", levelGroup))
				   return
                end
                NpcSay(string.format("你所在的组：#Y%s  #W所在的队：#R%s", levelGroup, msgGroup))
    elseif GetAnswer() == 9 then
               local group = player:GetSingleWarGroup()
               local startlevel = player:GetQuests():GetFlag(603)
                if group ~= 254 then
                   NpcSay("你没有资格领取报名奖励")
                   return 
                end
                if player:GetQuests():GetFlag(602) == 1 then
                   NpcSay("你已经领取过奖励。")
                   return 
                end
                if bProcess then
				   script:SetSaying(true)		
                   NpcSay("补偿已经发放，请查收。")
                   player:GetQuests():SetFlag(602, 1)
                   player:ChangeMoney(startlevel * 3000, 13017)
                   player:ChangeSingleWarGroup(0)
                   ShowError(string.format("#W获得银两%s", startlevel * 3000))

                end
    end
end



AddNpcTable(Npc000336)

