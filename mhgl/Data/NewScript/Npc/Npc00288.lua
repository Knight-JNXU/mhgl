-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Npc\Npc0288.out 

Preload("Quest70000.lua")
Preload("Quest70010.lua")
Preload("Quest23020.lua")
Npc000288 = {npc_id = 288, name = GetNpcName(288), 
quests = {Quest70000, Quest23020}}
Npc000288.Talk = function(self, bProcess)
  local flag430 = player:GetQuests():GetFlag(430)
  local quest23020 = player:GetQuests():GetQuest(23020)
  NpcAsk("百年修得同船渡，千年修得共枕眠。你想和你的爱人结为夫妻么？只要完成了我的任务，我可以帮助你。我这里还提供预订婚宴的服务，你想做什么呢？")
  if (player:GetLevel() >= 35 and flag430 == 0) or quest23020 then
   -- SetAnswer(1, "新手引导")
  --end
  SetAnswer(2, "情缘任务")
  SetAnswer(3, "婚宴筹备")
  SetAnswer(4, "解除婚约")
  SetAnswer(5, "结婚生子说明")
  SetAnswer(6, "我要参加婚礼")
  SetAnswer(7, "我要举行花轿游行")
  if player:HasTitle(666) and player:GetLevel() >= 80 then
     SetAnswer(8, "我们是来领取生育指南的")
	 end
     SetAnswer(9, "我不想结婚要宣布永久单身")
  
  SetAnswer(10, "我就是来看看")
  WaitAnswer(10)
  if GetAnswer() == 1 then
    if player:GetLevel() >= 35 and flag430 == 0 then
      Quest23020:Take()
    else
      Quest23020:Return()
    end
  elseif GetAnswer() == 2 then
      if not party then
         NpcSay("不组队你如何任务？")	
		return	
	  end
      NpcAsk("只有通过了我的考验，你才可以与意中人结为夫妻哦。你想做什么？")
      SetAnswer(1, "情缘任务")
      SetAnswer(2, "取消情缘任务")
      SetAnswer(3, "随便看看")
      WaitAnswer(3)
      if GetAnswer() == 1 then
      local member = party:GetInPartyMember(0)
      local member1 = party:GetInPartyMember(1)
        if member:HasTitle(834) or member1:HasTitle(834) then
           NpcSayParty("某某人可是宣告单身的。别来糊弄我")
	       return
	    end
        if party and party:GetCount() ~= party:GetRealMemNum() then
          NpcSayParty("此任务不能有暂离队员。")
          return 
        end
        local quest_ids = {70000, 70001, 70002, 70009}
        if HasQuest(quest_ids) then
          NpcSay("你们还没有完成我的考验哦。")
          return
		end
        if player:GetQuests():GetQuest(70010) ~= nil then
           Quest70010:Return()
        else
           Quest70000:Take()
        end
      elseif GetAnswer() == 2 then
        local ans = GetAnswer(i)
        local quest_ids = {70000, 70001, 70002, 70010}
        if HasQuest(quest_ids) then
           NpcAsk("倘若不能完成忠诚试炼任务，您与您的伴侣将不能结为秦晋之好。确定要取消任务吗？")
           SetAnswer(1, "是")
           SetAnswer(2, "否")
           WaitAnswer(2)
            if GetAnswer(i) == 1 then
                if IsProcess() then
                  local i = 1
                    if i <= 11 then
                      player:GetQuests():RemoveQuest(quest_ids[i])
                      i = i + 1
                    else
                      local flag = player:GetQuests():GetFlag(70005)
                      if flag ~= 0 then
                        player:GetQuests():RemoveFlag(70005)
                      end
                      if player:GetItems():GetItemCount(67000) >= 1 then
                        player:GetItems():RemoveItem(67000)
                      end
                      if player:GetItems():GetItemCount(67016) >= 1 then
                        player:GetItems():RemoveItem(67016)
                      end
                    end
                    NpcSay("当前任务已删除。")
				end
			end
		else
            NpcSay("你当前没有领取情缘任务吧？")
	    end
	  end
  elseif GetAnswer() == 3 then
    if party == nil or party:GetRealMemNum() ~= 2 then
       NpcSay({"想要预订婚宴的话，最好还是和你的爱人一起来吧。如此才可证明你对爱人的重视哦。"})
       return 
    end
    local member = party:GetInPartyMember(0)
    local member1 = party:GetInPartyMember(1)
    NpcAsk("新人们可以在我这里预订婚宴，预定时我会收取一定的手续费。预订好婚宴后，别忘了带上摆设婚宴所需要的银两，在预订时间的#P20#W分钟内找#P媒婆#W主持婚礼。如果取消已经订好的婚宴，需要重新预订哦。现在你想做什么？")
    SetAnswer(1, "预订婚宴")
    SetAnswer(2, "我们要取消婚宴")
    SetAnswer(3, "离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
        local relationSystem = player:GetRelationSystem()
        local flag = member:GetQuests():GetFlag(70005)
        local flag1 = member1:GetQuests():GetFlag(70005)
        if member:GetSex() == member1:GetSex() then
           NpcSayParty("本朝民风可没这么开放吖，同性怎可成婚？别开玩笑了>_<")
           return
        end
        if member and relationSystem:GetWifeId() ~= 0 then
           NpcSayParty("你的婚礼似乎已经举行过了吧。")
           return 
        end
        local Flag1 = member:GetQuests():GetFlag(70006)
        local Flag2 = member:GetQuests():GetFlag(70007)
        local Flag3 = member:GetQuests():GetFlag(70008)
        local Flag4 = member:GetQuests():GetFlag(70009)
        if Flag1 ~= 0 or Flag2 ~= 0 or Flag3 ~= 0 or Flag4 ~= 0 then
           NpcSayParty("你已经订过婚宴了，请在婚宴开始后#P20#W分钟内找媒婆主持婚礼，若是误了吉时，婚礼就会被取消。如果要重新订，先把之前的取消了再来吧。")
           return 
        end
        local masters = GetMessengers(member:GetChar_id(), 3)
        if table.getn(masters) ~= 0 then
            for j = 0, party:GetRealMemNum() - 1 do
                local master = party:GetInPartyMember(j)
                if master and master:GetChar_id() ~= member:GetChar_id() and masters[1] == master:GetChar_id() then
                   NpcSayParty("两位似乎有师徒关系呀，这辈分可不能乱，否则岂不被江湖同道取笑？你们还是解除了师徒关系再来吧。")
                   return 
                end
            end
        end
        local masters1 = GetMessengers(member1:GetChar_id(), 3)
        if table.getn(masters1) ~= 0 then
            for j = 0, party:GetRealMemNum() - 1 do
                local master = party:GetInPartyMember(j)
                if master and master:GetChar_id() ~= member1:GetChar_id() and masters1[1] == master:GetChar_id() then
                   NpcSayParty("两位似乎有师徒关系呀，这辈分可不能乱，否则岂不被江湖同道取笑？你们还是解除了师徒关系再来吧。")
                   return 
                end
            end
        end
        if member:GetQuests():GetFlag(70004) == 0 or member1:GetQuests():GetFlag(70004) == 0 then
           NpcSayParty("你们似乎还没有订亲吧？")
           return 
        end
        if flag ~= member1:GetChar_id() or flag1 ~= member:GetChar_id() then
           NpcSayParty("和你订亲的似乎不是此人吧？")
           return 
        end
        if GetFriendly(member:GetChar_id(), member1:GetChar_id()) < 1000 then
           NpcSayParty("你们一点感情基础都没有，如何能建立家庭？等你们彼此之间的好友度≥#P1000#W时再来找我吧。")
           return 
        end
        local flag2 = member:GetQuests():GetFlag(2000)
        if flag2 == 0 then
           NpcSayParty("想成家，没个房子怎么行？准新郎还是先替你的爱人准备好一座房子吧。")
           return 
        end
        local flag3 = member1:GetQuests():GetFlag(2000)
        if flag3 == 1 then
           NpcSayParty("二位既要结为夫妻，何苦还要分居？还是让女方先到#A钟原#W处把房产换为房契吧。")
           return 
        end
        local freeSlot = member:GetItems():GetFreeSlot(0)
        local freeSlot1 = member1:GetItems():GetFreeSlot(0)
        if freeSlot < 1 and freeSlot1 < 1 then
           NpcSayParty("请二位先清空包裹再来，至少需要留出1个位置。")
           return 
        end
        NpcAsk("美妙姻缘一线牵，简单是一种幸福，隆重可以让人终身难以忘怀，豪华风光的行礼是一个梦想。")
        SetAnswer(1, "查询婚宴价格")
        SetAnswer(2, "我再考虑一下")
        WaitAnswer(2)
        if GetAnswer() == 1 then
           NpcAsk("酒楼会为您将婚宴所需的所有用品都准备好，你想摆设哪个档次宴席？")
           SetAnswer(1, "简约型（花费100000两银子，摆2桌宴席）")
           SetAnswer(2, "经典型（花费300000两银子，摆8桌宴席）")
           SetAnswer(3, "喜庆型（花费500000两银子，摆15桌宴席）")
           SetAnswer(4, "豪华型（花费1000000两银子，摆30桌宴席）")
           SetAnswer(5, "我再考虑一下")
           WaitAnswer(5)
            if GetAnswer() == 1 then
                if member:GetMoney() < 100000 then
                   NpcSay("预订简约型婚宴需要收取手续费#P100000#W两银子，你似乎没这么多钱吧。")
                   return 
                end
                if relationSystem ~= nil and IsProcess() then
                   member:GetQuests():SetFlag(70040, 1)
                   relationSystem:RequestSelectMarriageTime(member:GetChar_id(), member1:GetChar_id())
				   player:ChangeMoney(-100000)
                   NpcSay("预订成功")
                   return
				end 
            elseif GetAnswer() == 2 then
                if member:GetMoney() < 300000 then
                   NpcSay("预订经典型婚宴需要收取手续费#P300000#W两银子，你似乎没这么多钱吧。")
                   return 
                end
                if relationSystem ~= nil and IsProcess() then
                   relationSystem:RequestSelectMarriageTime(member:GetChar_id(), member1:GetChar_id())
                   member:GetQuests():SetFlag(70040, 2)
				   player:ChangeMoney(-300000)
                   NpcSay("预订成功")
                   return
				end
            elseif GetAnswer() == 3 then
                if member:GetMoney() < 500000 then
                   NpcSay("预订喜庆型婚宴需要收取手续费#P500000#W两银子，你似乎没这么多钱吧。")
                   return 
                end
                if relationSystem ~= nil and IsProcess() then
                   relationSystem:RequestSelectMarriageTime(member:GetChar_id(), member1:GetChar_id())
                   member:GetQuests():SetFlag(70040, 3)
				   player:ChangeMoney(-500000)
                   NpcSay("预订成功")
                   return
				end
            elseif GetAnswer() == 4 then
                if member:GetMoney() < 1000000 then
                   NpcSay("预订豪华型婚宴需要收取手续费#P1000000#W两银子，你似乎没这么多钱吧。")
                   return 
                end
                if relationSystem ~= nil and IsProcess() then
                   relationSystem:RequestSelectMarriageTime(member:GetChar_id(), member1:GetChar_id())
                   member:GetQuests():SetFlag(70040, 4)
				   player:ChangeMoney(-1000000)
                   NpcSay("预订成功")
                   return 
				end
			end
		end
    elseif GetAnswer() == 2 then
        if party == nil then
           NpcSay("要取消婚宴，也该和您的爱人商量商量吧？请和您的爱人一起来吧。")
           return 
        end
        local member = party:GetInPartyMember(0)
        local member1 = party:GetInPartyMember(1)
        if party:GetRealMemNum() ~= 2 or member:GetSex() ~= 0 or member:GetSex() == member1:GetSex() then
           NpcSayParty("请和您的配偶一起来吧，男人要有担当，别忘了要让男方做队长。")
           return 
        end
        local Flag1 = member:GetQuests():GetFlag(70006)
        local Flag2 = member:GetQuests():GetFlag(70007)
        local Flag3 = member:GetQuests():GetFlag(70008)
        local Flag4 = member:GetQuests():GetFlag(70009)
        if Flag1 == 0 and Flag2 == 0 and Flag3 == 0 and Flag4 == 0 then
           NpcSayParty("你似乎没有订过婚宴吧？")
           return 
        end
        if bProcess then
           member:GetQuests():RemoveFlag(70006)
           member:GetQuests():RemoveFlag(70007)
           member:GetQuests():RemoveFlag(70008)
           member:GetQuests():RemoveFlag(70009)
           member:GetQuests():RemoveFlag(70040)
        end
        NpcSayParty("婚宴已经取消。")
	end
  elseif GetAnswer() == 4 then
    if player:GetQuests():GetFlag(70004) == 0 then
       NpcSay("你又没有订亲，别来这捣乱！")
       return 
    end
    NpcAsk("解除订婚关系，将不能正式结为夫妻哦，确定要这么做吗？")
    SetAnswer(1, "是")
    SetAnswer(2, "否")
    WaitAnswer(2)
    local ans = GetAnswer(i)
    if GetAnswer(i) == 1 then
        if IsProcess() then
           player:GetQuests():RemoveFlag(70004)
           local flag = player:GetQuests():GetFlag(70005)
            if flag ~= nil then
                player:GetQuests():RemoveFlag(70005)
            end
        end
        NpcSay("订婚关系已解除，如果需要重新订婚，再来找我吧。")
	end
  elseif GetAnswer() == 5 then
        NpcSay("一辈子只能结一次婚，请珍惜对方。")
        NpcSay("想要孩子的话，等双方都达到武道禅宗而且友好度达到1000，带上1000万就可以到我这里来领取生育指南了")
        NpcSay("请保证你是和结婚对象一起来，不然后果很难想象。")
        NpcSay("夫妻双方都可以各自拥有一个孩子，但是每位大侠一生中只能拥有一个孩子哦。")
  elseif GetAnswer() == 6 then
    if player:GetMap():GetLine_id() ~= 3 then
       NpcSay("请到3线参加婚宴。")
       return 
    end
    if bProcess then
       player:JumpMap(58100, 104, 293)
	end
  elseif GetAnswer() == 7 then
    local relationSystem = player:GetRelationSystem()
    local CharMarriageTime = relationSystem:GetMarriageTime()
    if CharMarriageTime == 0 then
       NpcSay("您都没订婚，来捣什么乱？")
       return 
    end
    if LuaI.GetRealDay(CharMarriageTime) < LuaI.GetRealDay(LuaI.GetServiceTime()) then
       NpcSay("您的婚礼都已经结束了，还游什么行？")
       return 
    end
    if party == nil then
       NpcSay("请和您的配偶一起来吧。")
       return 
    end
    local member = party:GetInPartyMember(0)
    local member1 = party:GetInPartyMember(1)
    if party:GetCount() > 2 then
       NpcSayParty("举行花轿游行只需要两个人就行了，非当事人请先退出队伍站到一旁观礼吧。")
       return 
    end
    if party:GetRealMemNum() ~= 2 or member:GetSex() == member1:GetSex() then
       NpcSayParty("请和您的配偶一起来吧。")
       return 
    end
    if member:GetSex() ~= 0 then
       NpcSayParty("请让男方作队长。")
       return 
    end
    if not player:GetItems():HasItem(67025) then
       NpcSayParty("请出示你的婚礼客人名册。")
       return 
    end
    if player:GetMap():GetLine_id() ~= 3 then
       NpcSay("请到3线举行花轿游行仪式。")
       return 
    end
    if relationSystem ~= nil then
       local flag = player:GetQuests():GetFlag(70042)
        if flag < 10 then
           NpcSayParty(string.format("您的客人名册里一共有#G%d#W个客人的签名卷轴，按照规矩，收集的签名卷轴数量在#G10#W张以下是不能进行花轿游行仪式的哦，赶紧去多收集点签名卷轴吧。", flag))
        elseif flag >= 10 and flag < 25 then
           NpcAsk(string.format("您的客人名册里一共有#G%d#W个客人的签名卷轴，以现在的签名卷轴数量可以为您举行#B简朴型#W的花轿游行，如果您收集到#G25#W个客人签名卷轴的话就可以为您举行#B经典型#W的花轿游行哦。", flag))
           SetAnswer(1, "我要举行简朴型的花轿游行")
           SetAnswer(2, "我再去收集一点签名卷轴")
           WaitAnswer(2)
            if GetAnswer() == 1 and IsProcess() then
               player:GetQuests():RemoveFlag(70042)
               player:GetItems():RemoveItem(67025)
               relationSystem:InitStreedKids(member:GetChar_id(), member1:GetChar_id(), 1)
               player:ShowRumor(string.format("#W %s #O和#W %s #O正在#G3#O线#P京城#O举行#B简朴型#O花轿游行仪式，大家赶快去凑热闹抢礼物啊！", member:GetCharNameLink(), member1:GetCharNameLink()), false)
			end
        elseif flag >= 25 and flag < 50 then
           NpcAsk(string.format("您的客人名册里一共有#G%d#W个客人的签名卷轴，以现在的签名卷轴数量可以为您举行#B经典型#W的花轿游行，如果您收集到#G50#W个客人签名卷轴的话就可以为您举行#B豪华型#W的花轿游行哦。", flag))
           SetAnswer(1, "我要举行经典型的花轿游行")
           SetAnswer(2, "我再去收集一点签名卷轴")
           WaitAnswer(2)
            if GetAnswer() == 1 and IsProcess() then
               player:GetQuests():RemoveFlag(70042)
               player:GetItems():RemoveItem(67025)
               relationSystem:InitStreedKids(member:GetChar_id(), member1:GetChar_id(), 2)
               player:ShowRumor(string.format("#W %s #O和#W %s #O正在#G3#O线#P京城#O举行#B经典型#O花轿游行仪式，大家赶快去凑热闹抢礼物啊！", member:GetCharNameLink(), member1:GetCharNameLink()), false)
			end
        elseif flag >= 50 then
           NpcAsk(string.format("您的客人名册里一共有#G%d#W个客人的签名卷轴，以现在的签名卷轴数量可以为您举行#B豪华型#W的花轿游行，现在就要举行花轿游行仪式吗？", flag))
           SetAnswer(1, "我要举行豪华型的花轿游行")
           SetAnswer(2, "等会儿再举行")
           WaitAnswer(2)
            if GetAnswer() == 1 and IsProcess() then
               player:GetQuests():RemoveFlag(70042)
               player:GetItems():RemoveItem(67025)
               relationSystem:InitStreedKids(member:GetChar_id(), member1:GetChar_id(), 3)
               player:ShowRumor(string.format("#W %s #O和#W %s #O正在#G3#O线#P京城#O举行#B豪华型#O花轿游行仪式，大家赶快去凑热闹抢礼物啊！", member:GetCharNameLink(), member1:GetCharNameLink()), false)
            end
		end
	end
  elseif GetAnswer() == 8 then
	    if player:GetMoney() < 10000000 then
           NpcSay("1000万都没有你如何生儿育女。")
           return 
        end			
        if party == nil then
           NpcSay("请和您的配偶一起来吧。")
           return 
        end
        if party:GetRealMemNum() ~= 2 then
           NpcSayParty("请两人一起来领取生育指南吧。")
           return 
        end
        local member = party:GetInPartyMember(0)
        local member1 = party:GetInPartyMember(1)
        local relationSystem = member:GetRelationSystem()
		    if not member:HasTitle(666) or not member1:HasTitle(666) then	
                 NpcSayParty("请确保你们两个人都领悟武道禅宗，否则很难在江湖动荡的日子中安全的照顾你的孩子。")
           return 
        end		
        if member:GetSex() == member1:GetSex() then
            if npc and npc:GetEnableBattle() then
					if IsProcess then
	                 script:SetSaying(true)
							   player:EncounterBattle(713)
							end
							NpcSayParty("#哼！同性恋见鬼去吧，我代表月亮强P你。")	
						end
		   return 
		  end	
        if member:GetItems():GetFreeSlot(0) < 1 or member1:GetItems():GetFreeSlot(0) < 1 then
           NpcSayParty("队伍中有人包裹已满，请各位至少预留一个空位再来。")
           return 
        end
        if member:GetQuests():GetType(928) == nil then
           member:GetQuests():SetRoundInfo(928, 1, 1, 1)
        end
        if member1:GetQuests():GetType(928) == nil then
           member1:GetQuests():SetRoundInfo(928, 1, 1, 1)
        end
        if (member:GetQuests():GetType(928) or member1:GetQuests():GetType(928)) and ((member:GetQuests():GetType(928) and member:GetQuests():GetType(928):GetTotalRound() >= 1) or member1:GetQuests():GetType(928) and member1:GetQuests():GetType(928):GetTotalRound() >= 1) then
           NpcSayParty("你们之中有人领取过，不能再领取了。")
           return 
        end
        if not bProcess then
           return 
        end
        if member:GetSex() == 0 then
            if relationSystem:GetWifeId() == member1:GetChar_id() then
			   player:ChangeMoney(-10000000)
            elseif relationSystem:GetWifeId() ~= member1:GetChar_id() then
						if IsProcess then
		                script:SetSaying(true)
							   player:EncounterBattle(713)
							end
			NpcSayParty("#哼！奸夫淫妇，受死吧。")	
			   return
            end
        elseif member:GetSex() == 1 then
            if relationSystem:GetHusbandId() == member1:GetChar_id() then
			         player:ChangeMoney(-10000000)
            elseif relationSystem:GetHusbandId() ~= member1:GetChar_id() then
				if IsProcess then
	                 script:SetSaying(true)
							   player:EncounterBattle(713)
							end
						NpcSayParty("#哼！奸夫淫妇，受死吧。")	
			   return
            end
        end
	      member:GetItems():AddItem(401570, 1)
        member:GetItems():AddItem(71008, 1)
        member:GetItems():AddItem(71009, 1)
	      member1:GetItems():AddItem(401570, 1)
        member1:GetItems():AddItem(71008, 1)
        member1:GetItems():AddItem(71009, 1)
        member:AddTitle(835)
        member1:AddTitle(835)
        member:AddTitle(836)
        member1:AddTitle(836)
        member:GetQuests():GetType(928):ChangeTotalRound(1)
        member1:GetQuests():GetType(928):ChangeTotalRound(1)
			  NpcSayParty("#恭喜！恭喜！你们爱情已经有了结果，得到生育指南，请努力造小人吧")
  elseif GetAnswer() == 9 then
    if party then
       NpcSay("宣布单身还带着人来！骗谁呢，先脱离队伍再说。")
       return 
    end
    if player:GetQuests():GetFlag(70004) == 1 then
       NpcSayParty("爱情如此神圣，你却要放弃？！已经有订婚关系了，还是先解除了婚约再来吧！")
       return 
    end
    local relationSystem = player:GetRelationSystem()
    if relationSystem:GetWifeId() ~= 0 or relationSystem:GetHusbandId() ~= 0 then
       NpcSayParty("做人要厚道！装逼是不道德的！已经有了家室的人瞎点，莫非是特意来消遣小女子的？")
       return 
    end
    if player:HasTitle(832) or player:HasTitle(833) or player:HasTitle(834) then
       NpcSay("已经对外声明过了，不用再大肆宣扬。")
	   return
	end
	if player:GetLevel() >= 80 then
	  if IsProcess() then
        script:SetSaying(true)
	   player:AddTitle(834)
       NpcSay("宣布单身，以后再也无法结婚了")
       player:ShowRumor(string.format("#A有谁能相信，%s #A居然选择单身一辈子#084",player:GetCharNameLink()), false)
	 end
	else
       NpcSay("希望你不是一时兴起，回去考虑清楚吧，领悟武道禅宗并且80级之后还是想单身的话，再来告诉我吧。")
	end
  end
end
end
AddNpcTable(Npc000288)

