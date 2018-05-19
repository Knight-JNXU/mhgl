Quest304001 = {
	quest_id = 304001,							-- 任务 ID
	type_id = 3041,								-- 大类 ID
	type_name = "法宝任务",							-- 任务名称
	name = "消灭妖魔",							-- 任务名称
	feature = { "cancel", "failOverTime" },		-- 任务特性

	round_info = {max_round = 10, limit_round = 20, limit_type = 1},
	time_mark = 304001,							-- 时间标志
	time_limit = 3600,
	require = {minLv = 30},
	tips = "队长经验有加成，队伍中玩家的职业有四种时也会有经验加成。"
}

function Quest304001:Take()
	if party == nil then
		NpcSay("必须要1人以上的队伍才能接任务")
		return false
	elseif party:GetRealMemNum() < 1 then
		NpcSayParty("（请单独组队接取法宝任务）")
		return false
	end
	for i = 0, party:GetRealMemNum() - 1 do
		local member = party:GetInPartyMember(i)
		if member then
		    if member:GetLevel() < 90 then
				NpcSayParty(string.format("玩家\#P%s\#W等级不足90级，无法领取“法宝任务”。", member:GetName()))
				return
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("（队伍中的玩家\#P%s\#W身上已有“法宝任务”，无法再次接获。）", member:GetName()))
				return
			elseif member:GetQuests():TimeMarkOver(self.time_mark, 10) == false then
				NpcSayParty(string.format("上次交给\#P%s\#W的任务都没有好好完成，让他\#G10\#W分钟后再来领取任务吧。",member:GetName()))
				return
			elseif member:GetQuests():GetType(3041) and member:GetQuests():GetType(3041):GetTotalRound() >= 20 then
				NpcSayParty(string.format("\#P%s\#W法宝次数已达\#G20\#W次，请明日再来吧。",member:GetName()))
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
	
	
		local moblist = {1140,1141,1142}
		
		if party:GetAvgLevel() < 175 then
			
	
			npclist = {401200,401201,401202}
		else
		
			npclist = {401200,401201,401202}
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
			self.descript = string.format("去\#P%s(%d,%d)\#W附近消灭\#A%s\#W。", mapName,loc.x+A, loc.y+B,npcName)
			self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}
			self.target_mob = {{ mob_id = mob_id, count = 1 }}
			AddQuestParty(self)
			NpcSayParty(string.format("去\#P%s(%d,%d)\#W附近消灭\#A%s\#W。", mapName,loc.x, loc.y,npcName))
			local qtype = player:GetQuests():GetType(self.type_id)     --增加任务次数
	        local T = player:GetQuests():GetQuest(self.quest_id)
			     T:UpdateData()			
	        return true
		end
end

function Quest304001:Return(character,partnerAlive)
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
		local Quest304001Round = character:GetQuests():GetType(self.type_id):GetRound()
		local Job = character:GetJob()
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
		    local coExp = 0.95
		    --基准经验
		    local  baseExp = EPH * coExp
			--经验时间系数
			local timecoExp = 1		
			--经验奖励
			Exp = math.floor(lvdiffModify * (baseExp / timecoExp * (6.7 + 0.6 * Quest304001Round) * RExp / 100 )) * 1.1
            --同伴经验奖励
            ExpPartner = math.floor(plvdiffModify * (baseExp / timecoExp * (6.7 + 0.6 * Quest304001Round) * RExp / 100 )) * 0.5			
			--角色职业加成奖励
			local JobplusExp = math.floor(Exp * JobcoExp) + 1
			--同伴职业加成奖励
			local pJobplusExp = math.floor(ExpPartner * JobcoExp) + 1		
			--金钱奖励
			local A = LvPlayer / 100
			Money =  3000 * Quest304001Round * A * 2 / 2 
			SMoney =  5000 * Quest304001Round * A * 2 / 2 
			
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
			if IsProcess() then				
				character:ChangeExp((Exp+JobplusExp)*buff*worldbuff*2*5*1.5,304)
				character:ChangeMoney(Money,304)			
				character:ChangeSMoney(SMoney,304)			
				if  JobCount > 2 then 
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d，额外奖励经验值%d", (Exp+JobplusExp)*buff*worldbuff*2*5*1.5, JobplusExp*buff*worldbuff))
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d", Money))
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得储备金%d", SMoney))
				else
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", (Exp+JobplusExp)*buff*worldbuff*2*5))
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d", Money))
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得储备金%d", SMoney))
                end												
				if partner and partnerAlive == true and partner:GetLevel()-character:GetLevel() < 5 then
				    character:GetCurPartner():ChangeExp((ExpPartner+pJobplusExp)*buffpartner*worldbuff,304)
					if  JobCount > 2 then 
		         character:GetScript():ShowError(string.format("\#W同伴获得经验值%d，额外奖励经验值%d", ExpPartner*buffpartner*worldbuff, pJobplusExp*buffpartner*worldbuff))	
					else
					  character:GetScript():ShowError(string.format("\#W同伴获得经验值%d", ExpPartner*buffpartner*worldbuff))  
          end
				end
				
				if Quest304001Round == 10 then
				  local c = math.random(1,200)
				  if c <= 20 then
						local itemc = RandTable({60234})
					  character:GetItems():AddItem(itemc, 1)
					  ShowMessage(string.format("\#W获得%s",GetItemName(itemc), character))
					end
				
					local i = math.random(1,200)
					local lv = character:GetLevel()
					  if lv <= 185 then
					    if i <= 20 then
						    local itema = RandTable({80701,80702})--69级奖励
						  	character:GetItems():AddItem(itema, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itema), character))
					  end
					end
				end
        RemoveQuest(self, character)		
        character:GetQuests():RemoveTimeMark(self.time_mark)
				if Quest304001Round >= qtype:GetMaxRound() then
					qtype:SetRound(0)
				end
			end
			return true
		else
		  return false
		end
end

function Quest304001:leaderReturn(character,partnerAlive)
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
		local Quest304001Round = character:GetQuests():GetType(self.type_id):GetRound()
		local Job = character:GetJob()
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
		    local coExp = 0.95
		    --基准经验
		    local  baseExp = EPH * coExp
			--经验时间系数
			local timecoExp = 1		
			--经验奖励
			Exp = math.floor(1.1 * lvdiffModify * (baseExp / timecoExp * (6.7 + 0.6 * Quest304001Round) * RExp / 100 ))  * 1.1
            --同伴经验奖励
            ExpPartner = math.floor(plvdiffModify * (baseExp / timecoExp * (6.7 + 0.6 * Quest304001Round) * RExp / 100 ))  * 0.5			
			--角色职业加成奖励
			local JobplusExp = math.floor(Exp * JobcoExp) + 1
			--同伴职业加成奖励
			local pJobplusExp = math.floor(ExpPartner * JobcoExp) + 1		
			--金钱奖励
			local A = LvPlayer / 100
			Money = 3000 * Quest304001Round * A * 2 / 2
			SMoney = 5000 * Quest304001Round * A * 2 / 2
			
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
			if IsProcess() then				
				character:ChangeExp((Exp+JobplusExp)*buff*worldbuff*2*5*1.5,304)
				character:ChangeMoney(Money,304)			
				character:ChangeSMoney(SMoney,304)			
				if  JobCount > 2 then 
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d，额外奖励经验值%d", (Exp+JobplusExp)*buff*worldbuff*2*5*1.5, JobplusExp*buff*worldbuff))
					character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
					character:GetScript():ShowError(string.format("\#W获得储备金%d", SMoney))
				else
					character:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", (Exp+JobplusExp)*buff*worldbuff*2*5))
					character:GetScript():ShowError(string.format("\#W获得银两%d", Money))
					character:GetScript():ShowError(string.format("\#W获得储备金%d", SMoney))
                end												
				if partner and partnerAlive == true and partner:GetLevel()-character:GetLevel() < 5 then
				    character:GetCurPartner():ChangeExp((ExpPartner+pJobplusExp)*buffpartner*worldbuff,304)
					if  JobCount > 2 then 
		                character:GetScript():ShowError(string.format("\#W同伴获得经验值%d，额外奖励经验值%d", ExpPartner*buffpartner*worldbuff, pJobplusExp*buffpartner*worldbuff))	
					else
					    character:GetScript():ShowError(string.format("\#W同伴获得经验值%d", ExpPartner*buffpartner*worldbuff))  
                    end
				end
								
															
				if Quest304001Round == 10 then
				  local c = math.random(1,100)
				  if c <= 20 then
						local itemc = RandTable({60234})
					  character:GetItems():AddItem(itemc, 1)
					  ShowMessage(string.format("\#W获得%s",GetItemName(itemc), character))
					end

					local lv = character:GetLevel()
					local i = math.random(1,200)
					if lv <= 185 then
					    if i <= 20 then
						    local itema = RandTable({80701,80702})--69级奖励
						  	character:GetItems():AddItem(itema, 1)
							  ShowMessage(string.format("\#W获得%s",GetItemName(itema), character))
					  end
					end
				end
	      RemoveQuest(self, character)		
        character:GetQuests():RemoveTimeMark(self.time_mark)
				if Quest304001Round >= qtype:GetMaxRound() then
					qtype:SetRound(0)
				end
			end			
			return true
		else
		    return false
		end
end
function Quest304001:PlayerWinButDied(character)
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
		character:GetScript():ShowError(string.format("\#W目标已消失，你已无法完成“法宝任务”"))	
		character:GetQuests():RemoveTimeMark(self.time_mark)
		return true
	end

	return false	
end
AddQuestTable(Quest304001)
