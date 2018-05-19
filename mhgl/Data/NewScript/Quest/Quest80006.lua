--北方
--跑商任务

Quest80006 = {							   
	quest_id = 80006,							                    -- 任务 ID
	type_id = 8002,								                    -- 大类 ID
	type_name = "帮派资金",                                         -- 大类任务名称
	--round_info = {limit_round = 8, limit_type = 2},                 -- 任务轮次
	name = "帮派资金",							                    -- 任务名称
	feature = {"nocancel" ,"failPlayerDie","failJoinParty"},		-- 任务特性
	end_npc = { npc_id=724, map_id=158 },	                        -- 开始、结束 NPC	
	target_item = {{item_id = 60008, count = 1}},	
	time_mark = 8002, 
}

function Quest80006:Take()	
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
	if player:GetGuild() == nil then
		NpcSay("你还没加入帮派")
		return false
	end
	if player:HasTempParty() then
		NpcSay("暂离队状态不能领取")
		return
	end
	if player:GetGuildPos() ~= 1 then
		NpcSay("只有帮主才可以。")
		return false
	end
	if player:GetMap():GetLine_id() ~= 0 then
		NpcSay("只能在3线领取。")
		return false
	end
	if party then	
		NpcSay("请先解散队伍再领取。")
		return false
	end	
	if player:GetQuests():GetFlag(8002) == 2 and Gtype:GetTotalRound() >= 7 then
		NpcSay("本周请提取七次请下周再来吧。")		
		return
	end
	if player:GetQuests():GetFlag(8002) == 1 and gtype:GetTotalRound() >= 8 then
		NpcSay("本周请提取七次请下周再来吧。")	
		return
	end
	local FreesLot = player:GetItems():GetFreeSlot(0)
	if FreesLot < 1 then
		NpcSay("请先整理你的当前背包，至少预留一个位置。")
		return false
	end
	local guild = player:GetGuild()
	local Fund = guild:GetFund()	
	if Fund < 50000000 then
		NpcSay("帮派资金不足50000000，无法提取。")
		return false
	end		
	if player:GetQuests():TimeMarkOver(8002, 0) == false then
		NpcSay("每天只能提取一次")
		return 
	end
	if player:GetQuests():TimeMarkOver(8002, 0) then
		player:GetQuests():RemoveTimeMark(8002)
	end		
	if IsProcess() then		
		script:SetSaying(true)
		player:GetItems():RemoveAllBusinessItem()		
		player:GetItems():AddItem(60008, 1)
		guild:ChangeFund(-50000000,6)		
		self.descript = "这是一张价值\#P5000000\#W两的帮派资金转换后的帮派通用商票可与本帮师爷购买物品"
		player:AddBuff(277, 0, 0, 0, 0, 100)
		AddQuest(Quest80006)
		if player:GetQuests():GetFlag(8002) == 2 then
			local Gtype = player:GetQuests():GetType(802)
			if Gtype == nil then
				player:GetQuests():SetRoundInfo(802, 48, 48, 2)
				Gtype = player:GetQuests():GetType(802)
			end
			Gtype:ChangeTotalRound(1)
			NpcSay(string.format("这是你本周提取的第\#P%d\#W次资金。", Gtype:GetTotalRound()))
		else
			local gtype = player:GetQuests():GetType(801)
			if gtype == nil then
				player:GetQuests():SetRoundInfo(801, 8, 8, 2)
				gtype = player:GetQuests():GetType(801)
			end
			gtype:ChangeTotalRound(1)
			NpcSay(string.format("这是你本周提取的第\#P%d\#W次资金", gtype:GetTotalRound()))
		end
		player:ChangeBusinessProfit(-1)
	end
	return true
end

function Quest80006:Return()
	local A = 0;
	local lv = player:GetLevel();
	if lv < 50 then
		A = 0
	elseif lv < 70 then
		A = 0 
	elseif lv < 90 then
		A = 0
	elseif lv < 170 then
		A = 0
	end

	if player:GetQuests():TimeMarkOver(8002, A) == false then
		--NpcSay("你这效率也太快了吧,现在人多,忙不过来,你等下再来交票吧~")
		NpcSay(string.format("一天只能提取一次资金。"))
		return false
	end	
	if player:GetGuild() == nil then
		NpcSay("我从不管理来历不明的人带来的帮派商票。")
		return false
	end
	if player:GetGuildPos() ~= 1 then
		NpcSay("我只收帮主送来的帮派商票。")
		return false
	end	
	if QuestCompleted(self) then
		local guild = player:GetGuild()
		local exp = 22500 
		local money = 90000 	
		local GDonate = 84 
		if player:GetQuests():GetFlag(8002) == 1 then
			exp = exp * 5.5
			money = money * 1.5
			GDonate = GDonate * 1.5
		end		
	
	  if player:HasBuff(279) then
	    GDonate = GDonate * 2 
	  end
	  if player:HasBuff(300) then
	    GDonate = GDonate * 3 
	  end
	
		local Profit = player:GetItems():GetBusinessMoney()	 * 2	
		local baoshi = math.random(1, 10)
		if IsProcess() then			
			script:SetSaying(true)
			NpcSay(string.format("正是有你这样的商人，帮里才有充裕的资金运作，特奖励你\#P%d\#W点经验和\#P%d\#W银两，另外再奖励\#P%d\#W点帮贡。", exp, money ,GDonate))
			player:ChangeExp(exp,8002)			
			player:ChangeMoney(money,8002)
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
			player:ChangeBusinessProfit(Profit - 40000)
			player:GetItems():RemoveAllBusinessItem()
		end
		return true
	else	
		NpcSay("你还有多余的没有注入本帮，不能再次提取")
		return false
	end
end
AddQuestTable(Quest80006)
