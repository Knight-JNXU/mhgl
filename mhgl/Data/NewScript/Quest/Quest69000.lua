--国庆中秋活动  荡寇安邦任务
-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest69000 = {
	quest_id = 69000,							-- 任务 ID
	type_id = 690,								-- 大类 ID
	type_name = "日常任务",
	round_info = {max_round = 5, limit_round = 30, limit_type = 1}, 
	name = "皇宫飞贼",							-- 任务名称
	feature = { "cancel", "failOverTime","failPlayerDie" ,"failEscape"},		-- 任务特性
	time_mark = 690,                          -- 时间标志  
	time_limit = 900,
}

-- Quest69000 拿取任务方法
function Quest69000:Take()
	if party == nil then
		NpcSay("必须\#G3\#W人以上的队伍才能担此大任。")
		return false
	elseif party:GetRealMemNum() < 1 then
		NpcSayParty("队伍人数少于\#G3\#W人，无法领取任务。")
		return false
	end

	local lvmin = player:GetLevel()
	local lvmax = player:GetLevel()			
	for i = 0, party:GetRealMemNum() - 1 do
		local member = party:GetInPartyMember(i)
		local qtype = member:GetQuests():GetType(self.type_id)
		if qtype == nil then
			member:GetQuests():SetRoundInfo(self.type_id, 5, 30, 1)
			qtype = member:GetQuests():GetType(self.type_id)
		end
		local TotalRound = qtype:GetTotalRound()
		if member then
			local lv = member:GetLevel()
			if lv < lvmin then
				lvmin = lv
			elseif lv > lvmax then
				lvmax = lv
			end	
		    if member:GetLevel() < 30 then
				NpcSayParty(string.format("玩家\#P%s\#W等级不足\#G30\#W级，无法领取任务。", member:GetName()))
				return false
			elseif lvmax - lvmin > 10 then
				NpcSayParty("队员之间等级不能超过\#G10\#W级。")
				return false
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("玩家\#P%s\#W身上已有任务，无法再次领取。", member:GetName()))
				return false
			elseif TotalRound > 29 then
				NpcSayParty(string.format("玩家\#P%s\#W今天已经做的够多了，快去歇息吧。", member:GetName()))
				return false
			end
		end
	end
	if not IsProcess() then return true end
	local qtype = player:GetQuests():GetType(self.type_id)
	local round = qtype:GetRound()
	script:SetSaying(true)
	local map_list = {19,34,1,34} 	--地图
	local npc_list = {300410,300411}  --npc
	local mob_list = {458,459}
	local t 
	if math.fmod(round,2) == 0 then
		t = 1
	else
		t = 2
	end
	local npc_id = npc_list[t]
	local mob_id = mob_list[t]
	local map_id = RandTable(map_list)
	local map = GetMap(map_id)
	local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-30, y2 = map:GetHeight()-30}}
    local loc = RandMapLoc(oneMap)
	NpcSayParty("据境外先锋人员回报，一伙飞贼正在暗中集结，大家速度去将他们消灭掉，扬我朝廷神威。")
	if loc then
		-- 生成一个新 NPC 在该随机位置上
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			local qtype = member:GetQuests():GetType(self.type_id)
			local TotalRound = qtype:GetTotalRound()
			if TotalRound == 0 then
				qtype:SetRound(0)
				member:GetQuests():SetFlag(20161222,0)
			end				
			script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 900)
			local mapName = GetMapName(loc.map_id)
			self.descript = string.format("\#G15\#W分钟内赶去\#P%s\#W一带，将这伙飞贼消灭掉。", mapName)
			self.target_mob = {{ mob_id = mob_id, count = 1 }}
			self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}			
			self.end_npc = { npc_id = 362, map_id = 34 }
			self.tips = "任务的当前次数越多，敌人能力越强，每完成\#G5\#W轮或一天内圆满完成\#G30\#W轮任务，都有额外奖励。每完成\#G5\#W轮，需重新领取任务。活动获得官职积分可去\#P长安\#W李将军处兑换官职。"
			AddQuest(self,member)
		end
	end
end

function Quest69000:TakeInBat(Character,r)	
	if Character == nil then return false end
	local member = Character:GetOwner()	
	local qtype = member:GetQuests():GetType(self.type_id)
	if qtype == nil then
		member:GetQuests():SetRoundInfo(self.type_id, 5, 30, 1)
		qtype = member:GetQuests():GetType(self.type_id)
	end
	local TotalRound = qtype:GetTotalRound()
	if TotalRound > 29 then
		member:GetScript():ShowHint("今天的荡寇任务已达\#G30\#W轮上限")
	end
	local q = member:GetQuests():GetQuest(self.quest_id)	
	if q and q:IsFailed() then 
		member:GetScript():ShowHint("任务已失败，请删除！")
		return false 
	elseif q then
		member:GetScript():ShowHint("你身上有其他任务，无法再次接获！")
		return false 
	end
	local round = qtype:GetRound()
	if not IsProcess() then return true end
	if r == 0 then
		if round == 0 then return end	
		local npc_list = {300410,300411}
		local mob_list = {458,459}
		local map_list = {19,34,1,34}
		local t 
		if math.fmod(round,2) == 0 then
			t = 1
		else
			t = 2
		end
		local npc_id = npc_list[t]
		local mob_id = mob_list[t]
		local map_id = RandTable(map_list)
		local map = GetMap(map_id)
		local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-30, y2 = map:GetHeight()-30}}
	    local loc = RandMapLoc(oneMap)
		if loc then
			script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 900)
			local mapName = GetMapName(loc.map_id)
			self.descript = string.format("又有一支飞贼出现了，\#G15\#W分钟内赶去\#P%s\#W一带，将他们消灭掉。", mapName)
			self.target_mob = {{ mob_id = mob_id, count = 1 }}
			self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}			
			self.end_npc = { npc_id = 362, map_id = 34 }
			self.tips = "任务的当前次数越多，敌人能力越强，每完成\#G5\#W轮或一天内圆满完成\#G30\#W轮任务，都有额外奖励。每完成\#G5\#W轮，需重新领取任务。活动获得官职积分可去\#P长安\#W李将军处兑换官职。"			
			AddQuest(self,member)	
			member:GetScript():ShowHint("又有一队更厉害的飞贼出现了，快去消灭他们")	
		end
	else
		local battle = Character:GetBattle()
		local leader = battle:GetCharacter(0):GetOwner()		
		local quest = leader:GetQuests():GetQuest(69000)	
		if quest then
			local npc_id = quest:GetTargetNpcId(1)
			local mob_id = quest:GetTargetMobId(1)
			local map_id = quest:GetTargetNpcMap(1)
			local x = quest:GetTargetNpcX(1)
			local y = quest:GetTargetNpcY(1)
			self.descript = string.format("又有一支飞贼出现了，\#G15\#W分钟内赶去\#P%s\#W一带，将他们消灭掉。", GetMapName(map_id))
			self.target_mob = {{ mob_id = mob_id, count = 1 }}
			self.target_npc = {{ npc_id = npc_id, map_id = map_id, x = x, y = y }}			
			self.end_npc = { npc_id = 367, map_id = 20300 }
			self.tips = "任务的当前次数越多，敌人能力越强，每完成\#G5\#W轮或一天内圆满完成\#G30\#W轮任务，都有额外奖励。每完成\#G5\#W轮，需重新领取任务。活动获得官职积分可去\#P长安\#W李将军处兑换官职。"			
			AddQuest(self,member)
			member:GetScript():ShowHint("又有一队飞贼出现了，快去消灭他们")	
		end
	end	
end

-- Quest69000 交回任务方法
function Quest69000:ReturnInBat(Character)

	if Character == nil then return false end
	local member = Character:GetOwner()
	local qtype = member:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	local q = member:GetQuests():GetQuest(self.quest_id)
	local battle = Character:GetBattle()
	local leader = battle:GetCharacter(0):GetOwner()		
	local quest = leader:GetQuests():GetQuest(self.quest_id)	
	if not quest then return false end
	local npc_id = quest:GetTargetNpcId(1)
	local map_id = quest:GetTargetNpcMap(1)
	local x = quest:GetTargetNpcX(1)
	local y = quest:GetTargetNpcY(1)
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local LvPlayer = member:GetLevel()	
	if party then
		AvgLevel = party:GetAvgLevel()
	else
		AvgLevel = member:GetLevel()
	end					
	local flag6900 = member:GetQuests():GetFlag(6900) ---官职积分
	local TotalRound = qtype:GetTotalRound()
	RemoveQuest(self, member)		
	if round >= qtype:GetMaxRound() then
		qtype:SetRound(0)
	end
	if npc then
		npc:Destroy()
	end
end

   

function Quest69000:ReturnFirst(Character,r)

	if Character == nil then return false end	
	local member = Character:GetOwner()	
	local qtype = member:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	local q = member:GetQuests():GetQuest(self.quest_id)
	local battle = Character:GetBattle()
	local leader = battle:GetCharacter(0):GetOwner()		
	local quest = leader:GetQuests():GetQuest(self.quest_id)	
	if not quest then return false end	
	local npc_id = quest:GetTargetNpcId(1)
	local map_id = quest:GetTargetNpcMap(1)
	local x = quest:GetTargetNpcX(1)
	local y = quest:GetTargetNpcY(1)
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local LvPlayer = member:GetLevel()	
	if party then
		AvgLevel = party:GetAvgLevel()
	else
		AvgLevel = player:GetLevel()
	end
	--角色等级差修正系数
	local lvdiffModify = 0
	local lvdiff = LvPlayer-AvgLevel
	if lvdiff <= -41 then
		lvdiffModify = 0.6				
	elseif lvdiff <= -31 then
		lvdiffModify = 0.7				
	elseif lvdiff <= -21 then
		lvdiffModify = 0.8				
	elseif lvdiff <= -11 then
		lvdiffModify = 0.9	
	elseif lvdiff <= 10 then
		lvdiffModify = 1
	elseif lvdiff <= 20 then
		lvdiffModify = 0.9
	elseif lvdiff <= 30 then
		lvdiffModify = 0.8
	elseif lvdiff <= 40 then
		lvdiffModify = 0.7
	else
		lvdiffModify = 0.6
	end	
	--召唤兽等级差修正系数					
	local pLvPlayer = 0		
	local partner = Character:GetCurPartner()
	if partner then
		pLvPlayer =partner:GetLevel()
	end			 
	local plvdiffModify = 0
	local plvdiff = math.abs(pLvPlayer-AvgLevel)--召唤兽等级-平均等级
	if plvdiff <= 4 then
		plvdiffModify = 1
	elseif plvdiff <= 6 then
		plvdiffModify = 0.9
	elseif plvdiff <= 8 then
		plvdiffModify = 0.75
	elseif plvdiff <= 10 then
		plvdiffModify = 0.55
	elseif plvdiff <= 12 then
		plvdiffModify = 0.30
	elseif plvdiff <= 30 then
		plvdiffModify = 0.3 - plvdiff/100
	else
		plvdiffModify = 1	
	end	
	local partnerAlive = partner and not partner:IsDead() or false			
	local flag6900 = member:GetQuests():GetFlag(6900) ---官职积分
	local flag = 1 --每轮战斗获得的官职积分
	local Q = math.random(20000,25000)
	local B = math.random(2000,5000)
	local Exp = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * lvdiffModify + Q
	local ExpPartner = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * plvdiffModify + B
	local Money = 50 * AvgLevel
	local SMoney = 50 * AvgLevel
	member:ChangeExp(Exp,2)	
	local A = math.random(1,15)
	local item = 0;
	if A == 1 then
	  item = 61226 -- 节日大礼包
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
    member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	
	elseif A == 2 then
	  item = 30001 -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	
	
	elseif A == 3 then     --魔兽要诀
	  item = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109}) -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  
  elseif A == 4 then 
	  item = RandTable({20006,20005,20004,20003,20002}) -- 五宝
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  end

  
	member:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	
	
	if r == 0 then
		member:ChangeMoney(Money,2)	
		member:GetScript():ShowError(string.format("\#W获得银两%d", Money))
	else
		member:ChangeSMoney(SMoney,2)	
		member:GetScript():ShowError(string.format("\#W获得储备金%d", SMoney))
	end
	member:GetQuests():SetFlag(6900,flag6900+flag)
	member:GetScript():ShowError(string.format("\#W获得官职积分%d", flag))
	if partner and partnerAlive == true and partner:GetLevel()-member:GetLevel() < 5 then
		member:GetCurPartner():ChangeExp(ExpPartner,2)
		member:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
end

function Quest69000:ReturnSecond(Character,r)
	
	if Character == nil then return false end	
	local member = Character:GetOwner()	
	local qtype = member:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	local q = member:GetQuests():GetQuest(self.quest_id)
	local battle = Character:GetBattle()
	local leader = battle:GetCharacter(0):GetOwner()		
	local quest = leader:GetQuests():GetQuest(self.quest_id)	
	if not quest then return false end
	local npc_id = quest:GetTargetNpcId(1)
	local map_id = quest:GetTargetNpcMap(1)
	local x = quest:GetTargetNpcX(1)
	local y = quest:GetTargetNpcY(1)
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local Exp = 0
	local ExpPartner = 0	
	local Money = 0
	local SMoney = 0
	local LvPlayer = member:GetLevel()	
	if party then
		AvgLevel = party:GetAvgLevel()
	else
		AvgLevel = player:GetLevel()
	end
	--角色等级差修正系数
	local lvdiffModify = 0
	local lvdiff = LvPlayer-AvgLevel
	if lvdiff <= -41 then
		lvdiffModify = 0.6				
	elseif lvdiff <= -31 then
		lvdiffModify = 0.7				
	elseif lvdiff <= -21 then
		lvdiffModify = 0.8				
	elseif lvdiff <= -11 then
		lvdiffModify = 0.9	
	elseif lvdiff <= 10 then
		lvdiffModify = 1
	elseif lvdiff <= 20 then
		lvdiffModify = 0.9
	elseif lvdiff <= 30 then
		lvdiffModify = 0.8
	elseif lvdiff <= 40 then
		lvdiffModify = 0.7
	else
		lvdiffModify = 0.6
	end	
	--召唤兽等级差修正系数					
	local pLvPlayer = 0		
	local partner = Character:GetCurPartner()
	if partner then
		pLvPlayer =partner:GetLevel()
	end			 
	local plvdiffModify = 0
	local plvdiff = math.abs(pLvPlayer-AvgLevel)
	if plvdiff <= 4 then
		plvdiffModify = 1
	elseif plvdiff <= 6 then
		plvdiffModify = 0.9
	elseif plvdiff <= 8 then
		plvdiffModify = 0.75
	elseif plvdiff <= 10 then
		plvdiffModify = 0.55
	elseif plvdiff <= 12 then
		plvdiffModify = 0.30
	elseif plvdiff <= 30 then
		plvdiffModify = 0.3 - plvdiff/100
	else
		plvdiffModify = 0	
	end	
	local partnerAlive = partner and not partner:IsDead() or false			
	local flag6900 = member:GetQuests():GetFlag(6900) ---官职积分
	local flag = 2 --每轮战斗获得的官职积分
	local Q = math.random(20000,25000)
	local B = math.random(2000,5000)
	local Exp = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * lvdiffModify + Q
	local ExpPartner = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * plvdiffModify + B
	local Money = 50 * AvgLevel
	local SMoney = 50 * AvgLevel
	local ItemId = 0
	if member:GetItems():GetFreeSlot(0) > 0 and ItemId ~= 0 then
		member:GetItems():AddItem(ItemId,1)	
		member:GetScript():ShowError(string.format("\#W获得%s",GetItemName(ItemId)))	
	end													
	member:ChangeExp(Exp,2)	
	local A = math.random(1,15)
	local item = 0;
	if A == 1 then
	  item = 61226 -- 节日大礼包
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	elseif A == 2 then
	  item = 30001 -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	
	
	elseif A == 3 then     --魔兽要诀
	  item = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109}) -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  
  elseif A == 4 then 
	  item = RandTable({20006,20005,20004,20003,20002}) -- 五宝
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  end



	member:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	
	if r == 0 then
		member:ChangeMoney(Money,2)	
		member:GetScript():ShowError(string.format("\#W获得银两%d", Money))
	else
		member:ChangeSMoney(SMoney,2)	
		member:GetScript():ShowError(string.format("\#W获得储备金%d", SMoney))
	end
	member:GetQuests():SetFlag(6900,flag6900+flag)
	member:GetScript():ShowError(string.format("\#W获得官职积分%d", flag))
	if partner and partnerAlive == true and partner:GetLevel()-member:GetLevel() < 5 then
		member:GetCurPartner():ChangeExp(ExpPartner,2)
		member:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
end

function Quest69000:ReturnThird(Character,r)

	if Character == nil then return false end	
	local member = Character:GetOwner()	
	local qtype = member:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	local q = member:GetQuests():GetQuest(self.quest_id)
	local battle = Character:GetBattle()
	local leader = battle:GetCharacter(0):GetOwner()		
	local quest = leader:GetQuests():GetQuest(self.quest_id)	
	if not quest then return false end
	local npc_id = quest:GetTargetNpcId(1)
	local map_id = quest:GetTargetNpcMap(1)
	local x = quest:GetTargetNpcX(1)
	local y = quest:GetTargetNpcY(1)
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local Exp = 0
	local ExpPartner = 0	
	local Money = 0
	local SMoney = 0
	local LvPlayer = member:GetLevel()	
	if party then
		AvgLevel = party:GetAvgLevel()
	else
		AvgLevel = player:GetLevel()
	end
	--角色等级差修正系数
	local lvdiffModify = 0
	local lvdiff = LvPlayer-AvgLevel
	if lvdiff <= -41 then
		lvdiffModify = 0.6				
	elseif lvdiff <= -31 then
		lvdiffModify = 0.7				
	elseif lvdiff <= -21 then
		lvdiffModify = 0.8				
	elseif lvdiff <= -11 then
		lvdiffModify = 0.9	
	elseif lvdiff <= 10 then
		lvdiffModify = 1
	elseif lvdiff <= 20 then
		lvdiffModify = 0.9
	elseif lvdiff <= 30 then
		lvdiffModify = 0.8
	elseif lvdiff <= 40 then
		lvdiffModify = 0.7
	else
		lvdiffModify = 0.6
	end	
	--召唤兽等级差修正系数					
	local pLvPlayer = 0		
	local partner = Character:GetCurPartner()
	if partner then
		pLvPlayer =partner:GetLevel()
	end			 
	local plvdiffModify = 0
	local plvdiff = math.abs(pLvPlayer-AvgLevel)
	if plvdiff <= 4 then
		plvdiffModify = 1
	elseif plvdiff <= 6 then
		plvdiffModify = 0.9
	elseif plvdiff <= 8 then
		plvdiffModify = 0.75
	elseif plvdiff <= 10 then
		plvdiffModify = 0.55
	elseif plvdiff <= 12 then
		plvdiffModify = 0.30
	elseif plvdiff <= 30 then
		plvdiffModify = 0.3 - plvdiff/100
	else
		plvdiffModify = 0	
	end	
	local partnerAlive = partner and not partner:IsDead() or false			
	local flag6900 = member:GetQuests():GetFlag(6900) ---官职积分
	local flag = 2 --每轮战斗获得的官职积分
	local Q = math.random(20000,25000)
	local B = math.random(2000,5000)
	local Exp = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * lvdiffModify + Q
	local ExpPartner = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 0.5 * 1.2 * (0.08 + 0.04 * round) * plvdiffModify + B
	local Money = 2 * 50 * AvgLevel
	local SMoney = 2 * 50 * AvgLevel
	local ItemId = 0
	member:ChangeExp(Exp,2)	
	local A = math.random(1,15)
	local item = 0;
	if A == 1 then
	  item = 61226 -- 节日大礼包
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	elseif A == 2 then
	  item = 30001 -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
	
	
	elseif A == 3 then     --魔兽要诀
	  item = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109}) -- 超级金柳露
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  
  elseif A == 4 then 
	  item = RandTable({20006,20005,20004,20003,20002}) -- 五宝
	  local name = GetItemName(item)
	  member:GetScript():ShowError(string.format("\#W获得%s", name))
	  member:GetItems():AddItem(item, 1)
    script:Rumor(string.format(" %s \#O在与飞贼小分队大战300回合后,凯旋归来，在追捕的途中竟然发现了一个\#B%s\#O！",member:GetCharNameLink(),name),false)														
  end
	member:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	if r == 0 then
		member:ChangeMoney(Money,2)	
		member:GetScript():ShowError(string.format("\#W获得银两%d", Money))
	else
		member:ChangeSMoney(SMoney,2)	
		member:GetScript():ShowError(string.format("\#W获得储备金%d", SMoney))
	end
	member:GetQuests():SetFlag(6900,flag6900+flag)
	member:GetScript():ShowError(string.format("\#W获得官职积分%d", flag))
	if partner and partnerAlive == true and partner:GetLevel()-member:GetLevel() < 5 then
		member:GetCurPartner():ChangeExp(ExpPartner,2)
		member:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
end
function Quest69000:Return()
end


-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest69000)
