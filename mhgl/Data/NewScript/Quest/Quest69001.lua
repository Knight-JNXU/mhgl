--wangzl
--元旦组队任务
Quest69001 = {
	quest_id = 69001,							-- 任务 ID
	type_id = 1023,								-- 大类 ID
	type_name = "嘉年华活动",							-- 任务名称
	name = "捣乱的小妖",							-- 任务名称
	feature = {"cancel", "failOverTime","failPlayerDie" ,"failEscape" },		-- 任务特性
	round_info = {max_round = 10, limit_round = 50, limit_type = 1},
	time_limit = 1800,
	require = {minLv = 300},
	--tips = ""
}
 
function Quest69001:Take()
	if party == nil then
		NpcSay("必须\#G3\#W人以上队伍才能领取任务。")
		return false
	elseif party:GetCount() < 1 then
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
		    if member:GetLevel() < 30 then
				NpcSayParty(string.format("玩家\#P%s\#W等级不足30级，无法领取任务。", member:GetName()))
				return
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("队伍中的玩家\#P%s\#W身上已有任务，无法再次接获。", member:GetName()))
				return
			elseif member:GetQuests():GetType(923) and member:GetQuests():GetType(923):GetTotalRound() >= 50 then
				NpcSayParty(string.format("\#P%s\#W任务次数已达\#G300\#W次，请明日再来吧。",member:GetName()))
				return
			end
		end
	end
	if maxLevel-minLevel >= 20 then
		NpcSay("队员之间等级不能超过\#G20\#W级。")
		return
	end
	if not IsProcess() then return true end
	local range ={8,7,6,1,21,10,11,12,84} 		
	local map_id = RandTable(range)
	local map = GetMap(map_id)
	local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-10, y2 = map:GetHeight()-10}}				
	local npc_id = 729
	local mob_id = 375
	local loc = RandMapLoc(oneMap)
	if loc then
		-- 生成一个新 NPC 在该随机位置上
		script:SetSaying(true)
		script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 1800)
		local mapName = GetMapName(loc.map_id)
		local npcName = GetNpcName(npc_id)
		NpcSayParty(string.format("嘉年华来了,三界又是一片繁荣的景象,不过最近收到线报,有一批扰乱的小妖也蠢蠢欲动,小侠士快前去收服吧。",mapName))
		self.descript = string.format("捣乱的小妖在\#P%s\#W一带逃窜，快去将他缉拿归案~！。",mapName)
		self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}
		self.target_mob = {{ mob_id = mob_id, count = 1 }}			
		AddQuestParty(self)
	end
end

function Quest69001:Return(actor,pater)
	if actor == nil then return false end	
	local qtype = actor:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	if not actor:GetQuests():HasQuest(69001) then return end	
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
	if actor:HasBuff(286) then --每轮战斗获得的活动积分
		flag = flag * 2
	end
	
	local Exp = 50000000
	local ExpPartner = (4 * AvgLevel + 10) * 6.6 * 70 * 0.75 * 2 * (0.01+0.18*round) * plvdiffModify * 0.5/15
	local SMoney = 50 * AvgLevel												
	actor:ChangeExp(Exp,2)	
	actor:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	actor:ChangeMoney(SMoney,2)	
	actor:GetScript():ShowError(string.format("\#W获得银子%d", SMoney))
	actor:GetQuests():SetFlag(6916,flag6916+flag)
	actor:GetScript():ShowError(string.format("\#W获得活动积分%d", flag))
	if pater and partner:GetLevel()-actor:GetLevel() < 5 and ExpPartner > 1 then
		actor:GetCurPartner():ChangeExp(ExpPartner,2)
		actor:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
	local number = math.random(1,100)
	local lv = player:GetLevel()
	if number < 30 and lv <= 90 then 
		self:GetTwo(actor)
	elseif number < 30 and lv >= 105 then 
		self:GetQwo(actor)
	end 
	actor:GetQuests():RemoveQuest(69001)
	if round >= qtype:GetMaxRound() then
	 qtype:SetRound(0)
 end
end




function Quest69001:GetTwo(actor)
	if not IsProcess() then return true end	
	if actor:GetItems():GetFreeSlot(0) <=0 then return end
	local rand = math.random(1,100)
	local item_id = 0
	if rand <= 3 then
	  item_id = RandTable({15006,15007,15008,15009})--强化石
	elseif rand <= 5 then
	  item_id = RandTable({20002,20003,20004,20005,20006})--五宝
	elseif rand <= 20 then     --魔兽要诀
		item_id = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109})--魔兽要诀

	elseif rand <= 30 then
	  item_id = RandTable({30000,30001})--c66  66
	
	elseif rand <= 50 then
		item_id = RandTable({60401,60402,60411,60412,60431,60432,60441,60442,60451,60452,60461,60462,60471,60472})--1,2级宝石
	else
		item_id = 20000 -- 藏宝图
	end
	if item_id ~= 0 then
		actor:GetItems():AddItem(item_id,1)	
		actor:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item_id)))
		script:Rumor(string.format("\#W%s\#O在参加嘉年华活动的时候，意外的获得了一个\#B%s\。", actor:GetName(), GetItemName(item_id)), false)								
	end		
end


function Quest69001:GetQwo(actor)
	if not IsProcess() then return true end	
	if actor:GetItems():GetFreeSlot(0) <=0 then return end
	local rand = math.random(1,100)
	local item_id = 0
	if rand == 1 then
		item_id = RandTable({40000,40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029})--魔兽要诀
	elseif rand <= 3 then
	  item_id = RandTable({15006,15007,15008,15009})--强化石
	elseif rand <= 5 then
	  item_id = RandTable({20002,20003,20004,20005,20006})--五宝
	elseif rand <= 20 then     --魔兽要诀
		item_id = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109})--魔兽要诀

	elseif rand <= 30 then
	  item_id = RandTable({30000,30001})--c66  66
	elseif rand <= 40 then
		item_id = 20001 -- 高级藏宝图
	elseif rand <= 60 then
		item_id = RandTable({60401,60402,60411,60412,60431,60432,60441,60442,60451,60452,60461,60462,60471,60472})--1,2级宝石
  else  
		item_id = 20000 -- 高级藏宝图
	end
	if item_id ~= 0 then
		actor:GetItems():AddItem(item_id,1)	
		actor:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item_id)))
		if rand == 1 and player:GetLevel() >= 90 then 
	   	script:Rumor(string.format("\#W%s\#O在参加嘉年华活动的时候，意外的获得了一个#B高级\#B%s\。", actor:GetName(), GetItemName(item_id)), false)						
	  else
	   	script:Rumor(string.format("\#W%s\#O在参加嘉年华活动的时候，意外的获得了一个\#B%s\。", actor:GetName(), GetItemName(item_id)), false)						
    end
	end		
end













AddQuestTable(Quest69001)

