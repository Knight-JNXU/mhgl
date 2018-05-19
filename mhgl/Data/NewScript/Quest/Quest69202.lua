--wangzl
--神器任务
Quest69202 = {
	quest_id = 69202,							-- 任务 ID
	type_id = 923,								-- 大类 ID
	type_name = "神器任务",							-- 任务名称
	name = "命殒轩辕剑",							-- 任务名称
	feature = {"cancel", "failOverTime","failPlayerDie" ,"failEscape" },		-- 任务特性
	round_info = {max_round = 10, limit_round = 30, limit_type = 1},
	time_limit = 1800,
	require = {minLv = 30},
	--tips = ""
}
 
function Quest69202:Take()
	if party == nil then
		NpcSay("必须\#G3\#W人以上队伍才能领取任务。")
		return false
	elseif party:GetCount() < 3 then
		NpcSayParty("队伍人数少于\#G3\#W人，无法领取任务。")
		return false
	end
	local maxLevel=0
	local minLevel=1000
	for i = 0, party:GetCount() - 1 do
		local member = party:GetMember(i)
		if member then
			if member:GetLevel()>maxLevel then
				maxLevel=member:GetLevel()
			end
			if member:GetLevel()<minLevel then
				minLevel=member:GetLevel()
			end
		    if member:GetLevel() <= 119 then
				NpcSayParty(string.format("玩家\#P%s\#W没有飞升,或等级小于119级，无法领取任务。", member:GetName()))
				return
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("队伍中的玩家\#P%s\#W身上已有任务，无法再次接获。", member:GetName()))
				return
			elseif member:GetQuests():GetType(923) and member:GetQuests():GetType(923):GetTotalRound() >= 30 then
				NpcSayParty(string.format("\#P%s\#W神器任务次数已达\#G30\#W次，请明日再来吧。",member:GetName()))
				return
			end
		end
	end
	if maxLevel-minLevel > 19 then
		NpcSay("队员之间等级不能超过\#G20\#W级。")
		return
	end
	if not IsProcess() then return true end
	local range ={1,21,20,15,14,26,28,29,6,250,13} 		
	local map_id = RandTable(range)
	local map = GetMap(map_id)
	local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-10, y2 = map:GetHeight()-10}}				
	local npclist = {300525,300526,300527,300528}
	local moblist = {539,540,541,542}				
	local R = math.random(1,4)
	local npc_id = npclist[R]
	local mob_id = moblist[R]		
	local loc = RandMapLoc(oneMap)
	if loc then
		-- 生成一个新 NPC 在该随机位置上
		script:SetSaying(true)
		script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 1800)
		local mapName = GetMapName(loc.map_id)
		local npcName = GetNpcName(npc_id)
		NpcSayParty(string.format("近日来凡界的妖魔鬼怪又开始打神器的注意了，难道当我们天庭都是不管事儿的吗，请各位速速前去\#P%s\#W一带，将这些邪魔绳之于法。",mapName))
		self.descript = string.format("邪魔在\#P%s\#W一带破坏神器，将这些邪魔绳之于法。",mapName)
		self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}
		self.target_mob = {{ mob_id = mob_id, count = 1 }}			
		AddQuestParty(self)
	end
end

function Quest69202:Return(actor,pater)
	if actor == nil then return false end	

	local qtype = actor:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	if not actor:GetQuests():HasQuest(69202) then return end	
	local q = actor:GetQuests():GetQuest(self.quest_id)
	local npc_id = npc:GetNpc_id()
	local map_id = npc:GetMap_id()
	local x = npc:GetCurPosX()
	local y = npc:GetCurPosY()
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local LvPlayer = actor:GetLevel()	
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
	local partner = actor:GetCurPartner()
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
	local flag6916 = actor:GetQuests():GetFlag(6916) ---活动积分
	local flag = 1
	
	local Exp = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 2 * (0.01+0.18*round) * lvdiffModify/15
	local ExpPartner = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 2 * (0.01+0.18*round) * plvdiffModify * 0.5/15
	local Money = 50 * AvgLevel												
	actor:ChangeExp(Exp,2)	
	actor:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	actor:ChangeMoney(Money,2)	
	actor:GetScript():ShowError(string.format("\#W获得银两%d", Money))
	actor:GetQuests():SetFlag(6916,flag6916+flag)
	actor:GetScript():ShowError(string.format("\#W获得神器积分%d", flag))
	if pater and partner:GetLevel()-actor:GetLevel() < 5 and ExpPartner > 1 then
		actor:GetCurPartner():ChangeExp(ExpPartner,2)
		actor:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
	local number = math.random(1,100)
	if number<= 20 then
		self:GetTwo(actor)
	end
	
	
	actor:GetQuests():RemoveQuest(69202)
	if round >= qtype:GetMaxRound() then
		qtype:SetRound(0)
	end
end

function Quest69202:GetTwo(actor)
	if not IsProcess() then return true end	
	if actor:GetItems():GetFreeSlot(0) <=0 then return end
	local rand = math.random(1,100)
	local Num = math.random(3,8)
	local item_id = 0
	if rand <= 5 then
	  item_id = 80091	     --抽奖券
	elseif rand <= 10 then
		item_id = RandTable({15006,15007,15008,15009})   --强化石
	elseif rand <= 20 then
		item_id = RandTable({20002,20003,20004,20005,20006})  --五宝
	elseif rand <= 35 then    --圣妖内丹
		item_id = 80084	
  end
	if item_id ~= 0 then
	    if item_id > 15005 and item_id < 15010 then
		   actor:GetItems():AddItem(item_id,Num)	
		   actor:GetScript():ShowError(string.format("\#W获得%s %d个",GetItemName(item_id),Num))
		   script:Rumor(string.format("\#W%s\#O在封印神器的时候，武艺突出，获得轩辕剑的赏识，特地奖励一个\#B%s %d个\#O。#101", actor:GetName(), GetItemName(item_id),Num), false)	
		else
		   actor:GetItems():AddItem(item_id,1)	
		   actor:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item_id)))
		   script:Rumor(string.format("\#W%s\#O在封印神器的时候，武艺突出，获得轩辕剑的赏识，特地奖励一个\#B%s\#O。#101", actor:GetName(), GetItemName(item_id)), false)	
		end						
	end		
end


AddQuestTable(Quest69202)

