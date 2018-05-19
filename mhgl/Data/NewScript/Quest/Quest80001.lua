--北方
--跑商任务

Quest80001 = {							   
	quest_id = 80001,							                    -- 任务 ID
	type_id = 800,								                    -- 大类 ID
	type_name = "跑商任务",                                         -- 大类任务名称
	--round_info = {limit_round = 8, limit_type = 2},                 -- 任务轮次
	name = "一级跑商",							                    -- 任务名称
	feature = {"nocancel" ,"failPlayerDie","failJoinParty"},		-- 任务特性
	end_npc = { npc_id=725, map_id=158 },	                        -- 开始、结束 NPC	
	target_item = {{item_id = 60001, count = 1}},	
	time_mark = 800, 
}

function Quest80001:Take()	
	local Gtype = player:GetQuests():GetType(802)
	if Gtype == nil then
		player:GetQuests():SetRoundInfo(802, 48, 48, 2)
		Gtype = player:GetQuests():GetType(802)
	end
	local gtype = player:GetQuests():GetType(801)
	if gtype == nil then
		player:GetQuests():SetRoundInfo(801, 8, 8, 2)
		gtype = player:GetQuests():GetType(801)
	end
	if player:HasTempParty() then
		NpcSay("暂离队状态不能领取跑商任务")
		return
	end
	if player:GetGuild() == nil then
		NpcSay("你还没加入帮派，不能领取跑商任务。")
		return false
	end
	if player:GetGuildPos() ~= 1 and player:GetGuildPos() ~= 2 and player:GetGuildPos() ~= 7 and player:GetGuildPos() ~= 9 then
		NpcSay("只有帮主、副帮主和商人精英才可以领取跑商任务。")
		return false
	end
	--[[if player:GetMap():GetLine_id() ~= 0 then
		NpcSay("跑商任务只能在3线领取。")
		return false
	end]]
	if party then	
		NpcSay("请先解散队伍再领取跑商任务。")
		return false
	end	
	if player:GetQuests():GetFlag(800) == 2 and Gtype:GetTotalRound() >= 48 then
		NpcSay("本周的普通跑商次数已满48次，请下周再来吧。")		
		return
	end
	if player:GetQuests():GetFlag(800) == 1 and gtype:GetTotalRound() >= 8 then
		NpcSay("本周的高效跑商次数已满8次，请下周再来吧。")	
		return
	end
	local FreesLot = player:GetItems():GetFreeSlot(0)
	if FreesLot < 1 then
		NpcSay("请先整理你的当前背包，至少预留一个位置。")
		return false
	end
	local guild = player:GetGuild()
	local Fund = guild:GetFund()	
	if Fund < 20000 then
		NpcSay("帮派资金不足20000，无法领取跑商任务。")
		return false
	end		
	if player:GetQuests():TimeMarkOver(800, 1) == false then
		NpcSay("上次交给你的任务都没有好好完成，等\#G60\#W分钟后再给你任务吧。")
		return 
	end
	if player:GetQuests():TimeMarkOver(800, 60) then
		player:GetQuests():RemoveTimeMark(800)
	end
	if IsProcess() then		
		script:SetSaying(true)
		player:GetItems():RemoveAllBusinessItem()		
		player:GetItems():AddItem(60000, 1)
		guild:ChangeFund(-20000,6)		
		self.descript = "这是一张价值\#P20000\#W两的帮派商票，通过与各地商人的贸易往来，帮派希望你能让它的价值增加到\#P50000\#W两。"
		player:AddBuff(277, 0, 0, 0, 0, 100)
		AddQuest(Quest80001)
		if player:GetQuests():GetFlag(800) == 2 then
			
			Gtype:ChangeTotalRound(1)
			NpcSay(string.format("这是你本周领取的第\#P%d\#W次普通跑商任务。", Gtype:GetTotalRound()))
		else
			
			gtype:ChangeTotalRound(1)
			NpcSay(string.format("这是你本周领取的第\#P%d\#W次高效跑商任务。", gtype:GetTotalRound()))
		end
		player:ChangeBusinessProfit(-1)
	end
	return true
end

function Quest80001:Return()	
  local A = 8;
  local lv = player:GetLevel();
  if lv < 50 then
    A = 2
  elseif lv < 70 then
    A = 4 
  elseif lv < 90 then
    A = 5
  elseif lv < 150 then
    A = 5
  end

  if player:GetQuests():TimeMarkOver(800, A) == false then
    NpcSay("你这效率也太快了吧,现在人多,忙不过来,你等下再来交票吧~")
    return false
  end
	
	
	if player:GetGuild() == nil then
		NpcSay("我从不管理来历不明的人带来的帮派商票。")
		return false
	end
	if player:GetGuildPos() ~= 1 and player:GetGuildPos() ~= 2 and player:GetGuildPos() ~= 7 and player:GetGuildPos() ~= 9 then
		NpcSay("我只收帮主、副帮主和商人精英送来的帮派商票。")
		return false
	end	
	if QuestCompleted(self) then
		local guild = player:GetGuild()
		local exp = 90000 
		local money = 10000 	
		local GDonate = 100 
		if player:GetQuests():GetFlag(800) == 1 then
			exp = exp * 1.5
			money = money * 1.5
			GDonate = GDonate * 1.5
		end		
	  if player:HasBuff(279) then
	    GDonate = GDonate * 2 
	  end
	  if player:HasBuff(300) then
	    GDonate = GDonate * 3 
	  end
	
	
	
	
	
		local Profit = player:GetItems():GetBusinessMoney() * 2 		
		local baoshi = math.random(1, 10)
		if IsProcess() then			
			script:SetSaying(true)
			NpcSay(string.format("正是有你这样的商人，帮里才有充裕的资金运作，特奖励你\#P%d\#W点经验和\#P%d\#W银两，另外再奖励\#P%d\#W点帮贡。", exp, money ,GDonate))
			player:ChangeExp(exp,800)			
			player:ChangeMoney(money,800)
			ShowError(string.format("\#W获得经验值%d，银两%d",exp,money))
			player:ChangeGDonate(GDonate,3)	
			ShowError(string.format("\#W获得帮派贡献%d",GDonate))
			if baoshi <= 3 and player:GetItems():GetFreeSlot(0) >= 1 then	
				local item = RandTable({30000,60122,60123,20000})
				player:GetItems():AddItem(item,1)
				player:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item)))
				script:Rumor(string.format("\#W%s\#O不愧为新一代的商人，饭跑跑特奖励一个\#P%s\#O。", player:GetName(), GetItemName(item)), false)
      end


   --[[   guild:ChangeProsper(5)
      ShowError("帮派繁荣度增加5")--]]








--[[			if baoshi == 1 and player:GetItems():GetFreeSlot(0) >= 1 then
				local item = RandTable({60402,60412,60422,60432,60442,60452,60462,60472})
				player:GetItems():AddItem(item,1)
				player:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item)))
				script:Rumor(string.format("\#W%s\#O不愧为新一代的商人，饭跑跑特奖励一颗\#P%s\#O。", player:GetName(), GetItemName(item)), false)
			end--]]
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			player:ShowGuildMsg(string.format("\#W%s\#G成功的为帮派增加了\#W%d\#G帮派资金", player:GetName(), Profit), player:GetGuildUid())			
			local guildLv = guild:GetManorScale()
			local guildFund = guild:GetFund() 
			if guildLv == 0 then
				if guildFund + Profit <= 5000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 5000000 then
					guild:ChangeFund(5000000-guildFund,6)														
				end
			elseif guildLv == 1 then
				if guildFund + Profit <= 10000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 10000000 then
					guild:ChangeFund(10000000-guildFund,6)														
				end			
			elseif guildLv == 2 then
				if guildFund + Profit <= 20000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 20000000 then
					guild:ChangeFund(20000000-guildFund,6)														
				end			
			elseif guildLv == 3 then
				if guildFund + Profit <= 30000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 30000000 then
					guild:ChangeFund(30000000-guildFund,6)														
				end			
			elseif guildLv == 4 then
				if guildFund + Profit <= 40000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 40000000 then
					guild:ChangeFund(40000000-guildFund,6)														
				end	
			elseif guildLv == 5 then
				if guildFund + Profit <= 50000000 then
					guild:ChangeFund(Profit,6)					
				elseif guildFund <= 50000000 then
					guild:ChangeFund(50000000-guildFund,6)														
				end		
			end
			player:RemoveBuff(277)
			RemoveQuest(self)			
			player:ChangeBusinessProfit(Profit - 20000)
			player:GetItems():RemoveAllBusinessItem()
		end
		return true
	else	
		NpcSay("帮派商票未达到交票金额，再去跑跑吧。")
		return false
	end
end
AddQuestTable(Quest80001)
