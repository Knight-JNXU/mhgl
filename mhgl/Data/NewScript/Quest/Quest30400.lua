Quest30400 = {
	quest_id = 30400,							-- 任务 ID
	type_id = 304,								-- 大类 ID
	type_name = "日常任务",							-- 任务名称
	name = "钟馗抓鬼",							-- 任务名称
	feature = { "cancel", "failOverTime" },		-- 任务特性

	round_info = {max_round = 10, limit_round = 100, limit_type = 1},
	time_mark = 30400,							-- 时间标志
	time_limit = 1800,
	require = {minLv = 30},
	tips = "队长经验有加成，队伍中玩家的职业有四种时也会有经验加成。"
}

function Quest30400:Take()
	if party == nil then
		NpcSay("必须要3人以上的队伍才能接任务")
		return false
	elseif party:GetRealMemNum() < 1 then
		NpcSayParty("（队伍人数少于#G3#W人无法接取日常任务）")
		return false
	end
	for i = 0, party:GetRealMemNum() - 1 do
		local member = party:GetInPartyMember(i)
		if member then
		    if member:GetLevel() < 30 then
				NpcSayParty(string.format("玩家\#P%s\#W等级不足30级，无法领取“日常任务”。", member:GetName()))
				return
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("（队伍中的玩家\#P%s\#W身上已有“日常任务”，无法再次接获。）", member:GetName()))
				return
			elseif member:GetQuests():TimeMarkOver(self.time_mark, 1) == false then
				NpcSayParty(string.format("上次交给\#P%s\#W的任务都没有好好完成，让他\#G10\#W分钟后再来领取任务吧。",member:GetName()))
				return
			
			elseif member:GetQuests():GetType(304) and member:GetQuests():GetType(304):GetTotalRound() >= 300 then				
				NpcSayParty(string.format("\#P%s\#W捉鬼次数已达\#G300\#W次，请明日再来吧。",member:GetName()))
				player:AntiHack()
				return
				end
		end
	end

	if not IsProcess() then
		return true
	end
		local AvgLv = party:GetAvgLevel()
		local range
		range = {1,6,7,10,14,15,26} 
		local map_id = RandTable(range)
		local map = GetMap(map_id)
		local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-10, y2 = map:GetHeight()-10}}				
		local npclist = {}
	
	
		local moblist = {178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207}
		
		if party:GetAvgLevel() < 50 then
			
	
			npclist = {584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613}
		else
		
			npclist = {584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613}
		end
		
		local R = math.random(1,5)
		local npc_id = npclist[R]
		local mob_id = moblist[R]
		
	    local loc = RandMapLoc(oneMap)
		if loc then
			-- 生成一个新 NPC 在该随机位置上
			script:SetSaying(true)
			script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 1800)
			local mapName = GetMapName(loc.map_id)
			local npcName = GetNpcName(npc_id)
			
			local A = math.random(1,100)
			local B = math.random(1,100)
		  --[[   记住要增加一个flga值来保存这个坐标值，好针对天眼通使用 --]]
			self.descript = string.format("去\#P%s(%d,%d)\#W附近抓\#A%s\#W。", mapName,loc.x+A, loc.y+B,npcName)
			self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}
			self.target_mob = {{ mob_id = mob_id, count = 1 }}
			AddQuestParty(self)
			NpcSayParty(string.format("去\#P%s(%d,%d)\#W附近抓\#A%s\#W。", mapName,loc.x, loc.y,npcName))
			local qtype = player:GetQuests():GetType(self.type_id)     --增加任务次数
	        local T = player:GetQuests():GetQuest(self.quest_id)
			     T:UpdateData()			
	        return true
		end
end

function Quest30400:Return(character,partnerAlive)
	if character == nil then return false end
	local qtype = character:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end
	local q = character:GetQuests():GetQuest(self.quest_id)

	-- if not match	npc id, map id and position, return false
	if not (npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and 
		q:GetTargetNpcMap(1) == npc:GetMap_id() and 
		q:GetTargetNpcX(1) == npc:GetCurPosX() and
		q:GetTargetNpcY(1) == npc:GetCurPosY())
	then
		return false
	end
		local Exp = 0
		local ExpPartner = 0
		local Money = 0
		local LvPlayer = character:GetLevel()
		local Quest30400Round = character:GetQuests():GetType(self.type_id):GetRound()
		local TotalRound = character:GetQuests():GetType(self.type_id):GetTotalRound()
		local Job = character:GetJob()
		local CharID = character:GetChar_id()
		local Honor = 0 --威望
		local GoddNess = 0 --善恶
		for i = 0, party:GetRealMemNum() - 1 do --判断等级差 给善恶点
			local member = party:GetInPartyMember(i)
			if member then
			    if member:GetChar_id() ~= CharID then
				   if member:GetLevel() <= LvPlayer - 20 then
				      Honor = Honor + 5
					  GoddNess = GoddNess + 3
				   end
				end
			end
		end
		--获取队伍平均等级
		local AvgLevel = party:GetAvgLevel()
		
		--队伍职业数
		local JobCount = 0
		--获取物理职业数量
		local Job1 = party:GetJobCount(1)
		if Job1 > 0 then
		    JobCount = JobCount + 1
		end
		--获取法系职业数量
		local Job2 = party:GetJobCount(2)
		if Job2 > 0 then
		    JobCount = JobCount + 1
		end
		--获取固伤职业数量
		local Job3 = party:GetJobCount(3)
		if Job3 > 0 then
		    JobCount = JobCount + 1
		end
		--获取封系职业数量
		local Job4 = party:GetJobCount(4)
		if Job4 > 0 then
		    JobCount = JobCount + 1
		end
		--职业加成系数
		local JobcoExp = 0
		if JobCount == 2 then 
		   JobcoExp = 0.05
		elseif JobCount == 3 then 
		   JobcoExp = 0.15
        elseif JobCount == 4 then
           JobcoExp = 0.2		
		end
		
		--角色等级差修正系数
		local lvdiffModify = 0
		local lvdiff = LvPlayer-AvgLevel
		if lvdiff <= -61 then
            lvdiffModify = 0.4
		elseif lvdiff <= -51 then
            lvdiffModify = 0.5	
		elseif lvdiff <= -41 then
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
		elseif lvdiff <= 50 then
            lvdiffModify = 0.6
        elseif lvdiff <= 160 then
            lvdiffModify = 0.5
		end
		
		--同伴等级差修正系数					
		local pLvPlayer = 0		
        local partner = character:GetCurPartner()
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
			
		if npc then
			npc:Destroy()
		end
		
		if q ~= nil then  
		    --随机系数
			local RExp = math.random(9500,10500)/10000						
			--标准经验
		    local EPH =(14 * AvgLevel + 10) * 6.6 * 70
		    --经验系数
		    local coExp = 0.75
		    --基准经验
		    local  baseExp = EPH * coExp
			--经验时间系数
			local timecoExp = 1		
			--经验奖励
			Exp = math.floor(lvdiffModify * (baseExp / timecoExp * (15 + 2.6 * Quest30400Round) * RExp / 100 )) * 20
            --同伴经验奖励
            ExpPartner = math.floor(plvdiffModify * (baseExp / timecoExp * (15 + 1.6 * Quest30400Round) * RExp / 100 )) * 0.5			
			--角色职业加成奖励
			local JobplusExp = math.floor(Exp * JobcoExp) + 1
			--同伴职业加成奖励
			local pJobplusExp = math.floor(ExpPartner * JobcoExp) + 1		
			--金钱奖励
			local A = LvPlayer / 80
			local B = LvPlayer / 120
			local SS = math.random(1000,2000)
			Money =  7000 * Quest30400Round * B + SS + 50000
			SMoney =  4000 * Quest30400Round * A * 2 / 2 
			
			local buff = character:HasBuff(218) and 2 or 1
			if character:HasBuff(219) then
				buff = 3
			end
			local buffpartner = character:HasBuff(246) and 2 or 1
			if character:HasBuff(247) then
				buffpartner = 3
			end
			local worldbuff = character:HasBuff(254) and 2 or 1
			local partner = character:GetCurPartner()
			
			local A = math.random(5000,6000)
			local AJobplusExp = math.floor(A * JobcoExp) + 1 
			local Exp = (A + AJobplusExp)*buff*worldbuff*Quest30400Round*40

			if IsProcess() then				
				local QuestFlagB = character:GetQuests():GetFlag(55202) -- 抓鬼计数 BB进阶专用
				if TotalRound <= 50 then
				   Exp = Exp * 2
				   Money = Money * 5
				   character:ChangeExp(Exp,304)		
				   character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
				   character:GetQuests():SetFlag(55202, QuestFlagB + 1) -- 抓鬼计数 BB进阶专用
				   character:ChangeMoney(Money,500)
				   character:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d", Money))
				else
				   Exp = Exp * 0.5
				   Money = Money * 5
				   character:ChangeExp(Exp,304)		
				   character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
				   character:GetQuests():SetFlag(55202, QuestFlagB + 1) -- 抓鬼计数 BB进阶专用
				   character:ChangeMoney(Money,500)
				   character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
				end
				if Honor > 0 then
				   character:ChangeHonor(Honor)
				   --character:SetHonor(character:GetHonor() + Honor)
				   character:GetScript():ShowError(string.format("\#W助人为乐，获得威望%d", Honor))
				end
	            if GoddNess > 0 then
				   character:ChangeGoodness(GoddNess, 44)
				   --character:ChangeGoodnessForScript(GoddNess, 44)
				   character:GetScript():ShowError(string.format("\#W助人为乐，获得善恶%d", GoddNess))
				end
				-- if  JobCount > 2 then 
					
					-- character:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d", Money))

				-- else
					-- character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
					-- character:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d", Money))
                -- end												
				if partner and partnerAlive == true and partner:GetLevel()-character:GetLevel() < 5 then
				    character:GetCurPartner():ChangeExp((ExpPartner+pJobplusExp)*buffpartner*worldbuff*20,304)
					if  JobCount > 2 then 
		         character:GetScript():ShowError(string.format("\#W同伴获得经验值%d，额外奖励经验值%d", ExpPartner*buffpartner*worldbuff*20, pJobplusExp*buffpartner*worldbuff*20))	
					else
					  character:GetScript():ShowError(string.format("\#W同伴获得经验值%d", ExpPartner*buffpartner*worldbuff*20))  
                    end
				end
				local X = math.random(1,100)
				local medicineList = RandTable({15006,15007,15008,15009})--二级药
				if X == 10 then
				  character:GetItems():AddItem(medicineList, 1)
				  ShowMessage(string.format("\#W获得%s",GetItemName(medicineList), character))
				end
				
			if TotalRound <= 100 then
				if Quest30400Round == 10 then
				  local c = math.random(1,100)
				  if c <= 100 then
						local itemc = RandTable({30001,20001,3000015006,15007,15008,15009})
					  character:GetItems():AddItem(itemc, 1)
					  ShowMessage(string.format("\#W获得%s",GetItemName(itemc), character))
					end
				
					local A = math.random(1,1000)
					local B = math.random(1,100)
					local D = math.random(1,100)
					local t = math.random(1,100)
					local i = math.random(1,200)
					local lv = character:GetLevel()
					local yueqi = RandTable({30008,30010,30011,30012,30013,30014,30015,30016,30017,30018,30019,30020,30021,30022,30023,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074})--乐器花暗器奖励
					  if lv <= 59 then
					    if i <= 70 then
						    local itema = RandTable({80170,80171,20450,20459,20468,20477,20486,20495,20504,20513,20523,20531,20540,20549,20558,20567,20576,20587,20588,20600,20611,20612})--69级奖励
						  	character:GetItems():AddItem(itema, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itema), character))
					    elseif i <= 105 then
					      character:GetItems():AddItem(yueqi, 1)
					      ShowMessage(string.format("\#W获得%s",GetItemName(yueqi), character))
							end
					  elseif lv <= 139 then
						  local itemb = RandTable({80170,80171,400031,400032,400033,400034,400035,400036,400037,400038,400039,400040,15006,15007,15008,15009})--69级奖励
					    if i <= 70 then
						  	character:GetItems():AddItem(itemb, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itemb), character))
					    elseif i <= 105 then
					      character:GetItems():AddItem(yueqi, 1)
					      ShowMessage(string.format("\#W获得%s",GetItemName(yueqi), character))
							end
					
					  elseif lv <= 159 then
						  local itemc = RandTable({80170,80171,400040,400041,400042,400043,400044,400045,400046,400047,400048,400049,15006,15007,15008,15009})--79级奖励
					    if i <= 70 then
						  	character:GetItems():AddItem(itemc, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itemc), character))
					    elseif i <= 105 then
					      character:GetItems():AddItem(yueqi, 1)
					      ShowMessage(string.format("\#W获得%s",GetItemName(yueqi), character))
							end
					  elseif lv <= 185 then
						  local itemd = RandTable({80170,80171,400031,400032,400033,400034,400035,400036,400037,400038,400039,400040,400041,400042,400043,400044,400045,400046,400047,400048,400049,15006,15007,15008,15009})--79级奖励
					    if i <= 70 then
						  	character:GetItems():AddItem(itemd, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itemd), character))
					    elseif i <= 105 then
					      character:GetItems():AddItem(yueqi, 1)
					      ShowMessage(string.format("\#W获得%s",GetItemName(yueqi), character))
					  end
				  end
			   end
			end
				
        RemoveQuest(self, character)		
        character:GetQuests():RemoveTimeMark(self.time_mark)
				if Quest30400Round >= qtype:GetMaxRound() then
					qtype:SetRound(0)
				end
			end
			return true
		else
		  return false
		end
end

function Quest30400:leaderReturn(character,partnerAlive)
	if character == nil then return false end
	local qtype = character:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end
	local q = character:GetQuests():GetQuest(self.quest_id)

	-- if not match	npc id, map id and position, return false
	if not (npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and 
		q:GetTargetNpcMap(1) == npc:GetMap_id() and 
		q:GetTargetNpcX(1) == npc:GetCurPosX() and
		q:GetTargetNpcY(1) == npc:GetCurPosY())
	then
		return false
	end

		local Exp = 0
		local ExpPartner = 0
		local Money = 0
		local LvPlayer = character:GetLevel()
		local Quest30400Round = character:GetQuests():GetType(self.type_id):GetRound()
		local TotalRound = character:GetQuests():GetType(self.type_id):GetTotalRound()
		local Job = character:GetJob()
		local CharID = character:GetChar_id()
		local Honor = 0 --威望
		local GoddNess = 0 --善恶
		for i = 0, party:GetRealMemNum() - 1 do --判断等级差 给善恶点
			local member = party:GetInPartyMember(i)
			if member then
			    if member:GetChar_id() ~= CharID then
				   if member:GetLevel() <= LvPlayer - 20 then
				      Honor = Honor + 5
					  GoddNess = GoddNess + 3
				   end
				end
			end
		end
		--获取队伍平均等级
		local AvgLevel = party:GetAvgLevel()
		
		--队伍职业数
		local JobCount = 0
		--获取侠客职业数量
		local Job1 = party:GetJobCount(1)
		if Job1 > 0 then
		    JobCount = JobCount + 1
		end
		--获取盗贼职业数量
		local Job2 = party:GetJobCount(2)
		if Job2 > 0 then
		    JobCount = JobCount + 1
		end
		--获取医生职业数量
		local Job3 = party:GetJobCount(3)
		if Job3 > 0 then
		    JobCount = JobCount + 1
		end
		--获取刺客职业数量
		local Job4 = party:GetJobCount(4)
		if Job4 > 0 then
		    JobCount = JobCount + 1
		end
		--职业加成系数
		local JobcoExp = 0
		if JobCount == 3 then 
		   JobcoExp = 0.05
        elseif JobCount == 4 then
           JobcoExp = 0.2		
		end
		
		--角色等级差修正系数
		local lvdiffModify = 0
		local lvdiff = LvPlayer-AvgLevel
		if lvdiff <= -61 then
            lvdiffModify = 0.4
		elseif lvdiff <= -51 then
            lvdiffModify = 0.5	
		elseif lvdiff <= -41 then
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
		elseif lvdiff <= 50 then
            lvdiffModify = 0.6
        elseif lvdiff <= 160 then
            lvdiffModify = 0.5
		end
		
		
		--同伴等级差修正系数					
		local pLvPlayer = 0		
        local partner = character:GetCurPartner()
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
			
		if npc then
			npc:Destroy()
		end
		
		if q ~= nil then  
		    --随机系数
			local RExp = math.random(9500,10500)/10000						
			--标准经验
		    local EPH =(14 * AvgLevel + 10) * 6.6 * 70
		    --经验系数
		    local coExp = 0.75
		    --基准经验
		    local  baseExp = EPH * coExp
			--经验时间系数
			local timecoExp = 1		
			--经验奖励
			Exp = math.floor(1.1 * lvdiffModify * (baseExp / timecoExp * (15 + 2.6 * Quest30400Round) * RExp / 100 ))  * 20
            --同伴经验奖励
            ExpPartner = math.floor(plvdiffModify * (baseExp / timecoExp * (6.7 + 1.6 * Quest30400Round) * RExp / 100 ))  * 0.5			
			--角色职业加成奖励
			local JobplusExp = math.floor(Exp * JobcoExp) + 1
			--同伴职业加成奖励
			local pJobplusExp = math.floor(ExpPartner * JobcoExp) + 1		
			--金钱奖励
			local A = LvPlayer / 80
			local B = LvPlayer / 120
			local SS = math.random(1000,2000)
			Money =  1500 * Quest30400Round * B + SS + 50000
			--上调10倍银两
			Money = Money * 10
			SMoney = 4000 * Quest30400Round * A * 2 / 2
			
			local buff = character:HasBuff(218) and 2 or 1
			if character:HasBuff(219) then
				buff = 3
			end
			local buffpartner = character:HasBuff(246) and 2 or 1
			if character:HasBuff(247) then
				buffpartner = 3
			end
			local worldbuff = character:HasBuff(254) and 2 or 1
			local partner = character:GetCurPartner()
			local A = math.random(5000,6000)
			local AJobplusExp = math.floor(A * JobcoExp) + 1 
			local Exp = (A + AJobplusExp)*buff*worldbuff*Quest30400Round*40
			if IsProcess() then				
				local QuestFlagB = character:GetQuests():GetFlag(55202) -- 抓鬼计数 BB进阶专用
				if TotalRound <= 50 then
				Money = Money * 6
				   character:ChangeExp(Exp,304)
				   character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
				   character:GetQuests():SetFlag(55202, QuestFlagB + 1) -- 抓鬼计数 BB进阶专用
				   character:ChangeMoney(Money,500)
				   character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
				else
				   Exp = Exp * 0.5
				   Money = Money * 5
				   character:ChangeExp(Exp,304)		
				   character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
				   character:GetQuests():SetFlag(55202, QuestFlagB + 1) -- 抓鬼计数 BB进阶专用
				   character:ChangeMoney(Money,500)
				   character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
				end
	            if Honor > 0 then
				   character:ChangeHonor(Honor)
				   --character:SetHonor(character:GetHonor() + Honor)
				   character:GetScript():ShowError(string.format("\#W助人为乐，获得威望%d", Honor))
				end
	            if GoddNess > 0 then
				   character:ChangeGoodness(GoddNess, 44)
				   --character:ChangeGoodnessForScript(GoddNess, 44)
				   character:GetScript():ShowError(string.format("\#W助人为乐，获得善恶%d", GoddNess))
				end
				-- if  JobCount > 2 then 
					
					-- character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
				-- else
					-- character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
					
                -- end												
				if partner and partnerAlive == true and partner:GetLevel()-character:GetLevel() < 5 then
				    character:GetCurPartner():ChangeExp((ExpPartner+pJobplusExp)*buffpartner*worldbuff*20,304)
					if  JobCount > 2 then 
		                character:GetScript():ShowError(string.format("\#W同伴获得经验值%d，额外奖励经验值%d", ExpPartner*buffpartner*worldbuff*20, pJobplusExp*buffpartner*worldbuff*20))	
					else
					    character:GetScript():ShowError(string.format("\#W同伴获得经验值%d", ExpPartner*buffpartner*worldbuff*20))  
                    end
				end
				local X = math.random(1,100)
				local medicineList = RandTable({15006,15007,15008,15009})--二级药
				if X == 10 then
				  character:GetItems():AddItem(medicineList, 1)
				  ShowMessage(string.format("\#W获得%s",GetItemName(medicineList), character))
				end
			if TotalRound <= 100 then
				if Quest30400Round == 10 then
				  local c = math.random(1,100)
				  if c <= 20 then
						local itemc = RandTable({600033})
					  character:GetItems():AddItem(itemc, 1)
					  ShowMessage(string.format("\#W获得%s",GetItemName(itemc), character))
					end
					
					
					
					local A = math.random(1,1000)
					local B = math.random(1,100)
					local C = math.random(1,100)
					local D = math.random(1,100)
					local t = math.random(1,100)
					local lv = character:GetLevel()
					local i = math.random(1,100)
					local yueqi = RandTable({30008,30010,30011,30014,30015,30016,30017,30018,30019,30020,30021,30022,30023,15008,15009,15006,15007})--乐器花奖励
					 if lv <= 185 then
						  local itemd = RandTable({600032})--79级奖励
					    if i <= 70 then
						  	character:GetItems():AddItem(itemd, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itemd), character))
					    elseif i <= 85 then
					      character:GetItems():AddItem(yueqi, 1)
					      ShowMessage(string.format("\#W获得%s",GetItemName(yueqi), character))
					  end
					end
				end
            end				
				
	      RemoveQuest(self, character)		
        character:GetQuests():RemoveTimeMark(self.time_mark)
				if Quest30400Round >= qtype:GetMaxRound() then
					qtype:SetRound(0)
				end
			end			
			return true
		else
		    return false
		end
end
function Quest30400:PlayerWinButDied(character)
	if character == nil then return false end
	local q = character:GetQuests():GetQuest(self.quest_id)
	
	-- if not match	npc id, map id and position, return false
	if not (npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and 
		q:GetTargetNpcMap(1) == npc:GetMap_id() and 
		q:GetTargetNpcX(1) == npc:GetCurPosX() and
		q:GetTargetNpcY(1) == npc:GetCurPosY())
	then
		return false
	end

	if q then
		q:SetFail(true)
		q:UpdateData()
		character:GetScript():ShowError(string.format("\#W目标已消失，你已无法完成“日常任务”"))	
		character:GetQuests():RemoveTimeMark(self.time_mark)
		return true
	end

	return false	
end
AddQuestTable(Quest30400)
