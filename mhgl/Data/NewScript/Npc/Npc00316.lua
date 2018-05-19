Npc00724= {	
	npc_id = 724,				
	name = GetNpcName(724),
}

function Npc00724:Talk(bProcess)
	NpcAsk("各大帮派的帮主每周周日0：00时至下周五19：00的时段内可以到我这里竞标参加帮派比武大赛，想展示一下你们帮派的实力吗？还等什么呢？赶快来报名参加吧！")	
	SetAnswer(1, "我要竞标")
	SetAnswer(2, "进入比武场地")
	SetAnswer(3, "帮派竞标规则介绍")
	SetAnswer(4, "帮派比武介绍")
	SetAnswer(5, "帮派比武积分排行榜")
	SetAnswer(6, "我所在帮派的比武积分")
--	SetAnswer(7, "查看我们帮的分组情况")
	SetAnswer(8, "离开")
	WaitAnswer(8)
	if GetAnswer() == 1 then
		local wDay = LuaI.GetRealWDay();
		local hour = LuaI.GetRealHour();
		if wDay <= 4 or wDay == 5 and hour <= 18 then
			local guild = player:GetGuild();
			local guildPos = player:GetGuildPos();
			if guild ~= nil and guildPos == 1 then
				local fund = guild:GetFund();
				local Bid = guild:GetGuildPvPBid();
				local msg = string.format("所在帮派本周竞标价为: %d 现存帮派资金为: %d", Bid, fund);--guild:GetFund(), guild:GetGuildPvPBid());	
				local msgBid = string.format("%d", Bid);
				local ans = AskString(msg, msgBid);			--輸入投標價				
				if bProcess then	
					script:SetSaying(true)
					local num = tonumber(ans);
						if num == nil then
							num = 0;
						end
						-- 需在此檢查是否有足夠金錢
					if num >= 200000 then	
						local change = num - guild:GetGuildPvPBid();
						if change <= 0 then
							NpcSay("竞价价格需要高于上一次竞价。")
						else
							wDay = LuaI.GetRealWDay();
							hour = LuaI.GetRealHour();
							if wDay <= 4 or wDay == 5 and hour <= 18 then
								if guild:GetGuildPvPBid() <= 200000 then
									script:Rumor(string.format("\#P%s\#O的帮主 %s \#O刚刚在长安帮派竞赛主持人处进行了本周帮战的竞标，心中窃喜：嘻嘻，我帮扬名立万的时候终于到来了！ ", player:GetGuild():GetName(), player:GetCharNameLink()), false)	
								end
								guild:ChangeGuildPvPBid(change);
								if num > fund then
									NpcSay("请注意！你所在帮派的帮派资金并不足以支付你所投的竞标价，请在星期五19:00前补足帮派资金，以免直接被判竞标失败。")
								end
								NpcSay("竞价成功，本周周五19:00点将在系统广播入选帮派。")	
							else
								NpcSay("现在不是竞标时间，竞标开放时间为：每周周日0：00时至下周五19：00")
							end	
						end	
					else
						NpcSay("竞价价格不得低于200000。")
					end	
				end
			else
				NpcSay("必须为帮派的帮主才有资格进行竞标。")	
			end		
		else
			NpcSay("现在不是竞标时间，竞标开放时间为：每周周日0：00时至下周五19：00")	
		end
	elseif GetAnswer() == 2 then
		local wDay = LuaI.GetRealWDay();
		local hour = LuaI.GetRealHour();
		local minute = LuaI.GetRealMinute();
		local guildWarStatus = LuaI.GetGuildWarStatus();	
		local guild = player:GetGuild();
		local joinPeriod = player:GetJoinGuildPeriod();
		if HasQuest(30601) or HasQuest(30602) or HasQuest(30603) or HasQuest(80001) 
		or HasQuest(80002) or HasQuest(80003) or HasQuest(80004) then
			NpcSay("身上有特殊任务不能参与帮战。")
			return
		end
		if player:GetMap():GetLine_id() ~= 1 then
		  NpcSay("帮派比武大会将在1线进行，请找1线的帮派竞赛大使进入比武会场。")
		  return
		end
		if party then 
		  NpcSay("组队状态无法进入比武会场。")
		  return
		end
		if player:GetLevel() <= 30 then
		  NpcSay("等级小于30级无法进入比武会场。")
		  return
		end
		if guild == nil then
		  NpcSay("没有帮派怎么进行帮战呢？想加入帮派的话你可以到长安里找帮派管理人。")
		  return
		end
		if guild:GetGuildPvPGroup() == 0 then
		  NpcSay("你所在的帮派不具备参与本周帮战的资格。")
		  return
		end
		if 	guildWarStatus == 3 then 
		  NpcSay("你在帮里的资历太浅，没有资格参与帮战。需在所在帮派时间长于3天才有资格参战。")
		  return
		end
		if wDay ~= 6 and hour ~= 20 and minute >= 30 then 
		  NpcSay("现在不是入场时间。周六20：00~20：30为帮战比武入场时间。")
		  return
		end
		
		if joinPeriod > 3 * 24 * 3600 then
		  if guild:GetGuildPvPGroup() == 1 then
		    player:JumpMap(56400, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 2 then
		    player:JumpMap(56401, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 3 then
		    player:JumpMap(56402, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 4 then
		    player:JumpMap(56403, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 5 then
		    player:JumpMap(56404, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 6 then
		    player:JumpMap(56405, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 7 then
		    player:JumpMap(56406, 31, 116);
		  elseif guild:GetGuildPvPGroup() == 8 then
		    player:JumpMap(56407, 31, 116);
		  end
		end

	elseif GetAnswer() == 3 then
		NpcSay("各大帮派的帮主每周周日0：00时至下周五19：00的时段内可以到我这里竞标参加帮派比武大赛。每次竞标价不得底于200000帮派资金，在竞标结果公布前，均可以在我这里重新竞标。")
	elseif GetAnswer() == 4 then
		NpcSay("帮派比武每周举办一次，采用竞标报名的方式，每期将有16个帮派获得参赛资格。入围的16个帮派随机分为6组，分别在周六20:30开赛。 循环赛中每场比武的时间为90分钟，胜、平、负的帮派可分别获得积分5点、2点和1点，每场获胜的帮派将获得30万的帮派资金，参赛成员也可获得各种奖励。")
	elseif GetAnswer() == 5 and bProcess then
		player:ShowGuildRank()
	elseif GetAnswer() == 6 then
		local guild = player:GetGuild();
		if guild ~= nil then
			NpcSay(string.format("所在帮派的帮派比武积分为\#P%d\#W分。",guild:GetGuildPvPScore()))	
		else
			NpcSay("你不属于任何帮派，想加入帮派的话你可以到京城里找帮派管理员。")
		end	
	elseif GetAnswer() == 7 then	
		local wDay = LuaI.GetRealWDay();
		local hour = LuaI.GetRealHour();
		local minute = LuaI.GetRealMinute();
		if wDay == 5 and hour == 19 and minute >= 30 or
			wDay == 5 and hour >= 20 or	
			wDay == 6 and hour < 22 then
			NpcSay("帮派对阵表。")
		else		
			NpcSay("暂未产生新一轮的帮派对阵表。")
		end	
	end
end

AddNpcTable(Npc00724)