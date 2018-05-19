-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest30602 = {
	quest_id = 30602,							-- 任务 ID
	type_id = 311,								-- 大类 ID
	type_name = "镖局任务",
	round_info = {limit_round = 50, limit_type = 1}, 
	name = "二级押镖",							-- 任务名称
	feature = {"nocancel" ,"failPlayerDie","failEscape","failJoinParty"},						-- 任务特性
	time_mark = 306,                          -- 时间标志  
	encount_npc = { npc_id = 300284, map_id = 0, step = math.random(300,500), count = -1 },
	--encount_npc = {{npc_id = 300290, map_id = 0, step = math.random(250,400), count = -1}},
	--target_item = { {item_id=70121, count=1} },
	target_follower = { mob_id = 999 },
	require = {minLv = 30}
}

-- Quest30602 拿取任务方法
function Quest30602:Take()
    local lv = player:GetLevel()
	local MPartner = player:GetPartners():GetCount()
	local MaxPartner = player:GetMaxPartner()
	local flag = player:GetQuests():GetFlag(306)

	if lv < 50 then
		NpcSay("押镖可不是闹着玩的，少侠还是多练练再来吧。")
		return 
	end	
	if party then
		NpcSay("押镖不能组队！")
		return 
	end	
	if player:HasBuff(260) then
		NpcSay("做事要专一，先把镖局的其他任务完成了来吧。")
		return
	end
	--[[if MaxPartner <= MPartner then
		NpcSay("同伴携带数量已达上限无法领取镖银。")
		return
	end]]
	if player:HasTempParty() then
		NpcSay("暂离队状态不能押镖")
		return
	end
    if player:GetQuests():TimeMarkOver(306, 15) == false then
		NpcSay("现在没有镖银了，少侠等一会来吧。")
		return false
	end
	if player:GetVP() < 2 then
		NpcSay("体力不足，不能领取任务。")
		return 
	end
	if not CanAddRound(self.type_id) then
		NpcSay("少侠歇歇明天再来吧，别累坏了。")
		return 
	end

	if not IsProcess() then return true end
	script:SetSaying(true)

	local npcList = {
					{npc_id = 534, map_id = 99,  tip ="\#P程咬金在大唐官府，Alt+M可以查看大地图"},
					{npc_id = 581, map_id = 119,  tip ="\#P藏经阁在化生寺，Alt+M可以查看大地图"},
					{npc_id = 681,  map_id = 134,  tip ="\#P秦琼府在长安城,Alt+M可以查看大地图"},
					{npc_id = 531, map_id = 97,  tip ="\#P地藏王府在地府，Alt+M可以查看大地图"},
					{npc_id = 519, map_id = 95,  tip ="\#P潮音洞在普陀山，Alt+M可以查看大地图"},
					{npc_id = 478, map_id = 81,  tip ="\#P大象洞在狮驼岭，Alt+M可以查看大地图"},
					{npc_id = 479, map_id = 82,  tip ="\#PP老雕洞在狮驼岭，Alt+M可以查看大地图"},
					{npc_id = 480, map_id = 83,  tip ="\#P狮王洞在狮驼岭，Alt+M可以查看大地图"},
					{npc_id = 509, map_id = 88,  tip ="\#P魔王居在魔王寨，Alt+M可以查看大地图"},
					{npc_id = 510, map_id = 100,  tip ="\#P盘丝洞在盘丝岭，Alt+M可以查看大地图"},
					{npc_id = 511, map_id = 100,   tip ="\#P盘丝洞在盘丝岭，Alt+M可以查看大地图"},
					{npc_id = 513, map_id = 91,  tip ="\#P乾坤殿在五庄观，Alt+M可以查看大地图"},
					{npc_id = 466,  map_id = 77,  tip ="\#P凌霄宝殿在天宫，Alt+M可以查看大地图"},
					{npc_id = 539, map_id = 104,  tip ="\#P灵台宫在方寸山，Alt+M可以查看大地图"},
					{npc_id = 450, map_id = 64,  tip ="\#P水晶宫在东海龙宫，Alt+M可以查看大地图"}
					}
	local r = RandTable(npcList)				-- 随机从 table 中取一个 object
	local npcName = GetNpcName(r.npc_id)		-- 取该 NPC 名字
	local mapName = GetMapName(r.map_id)		-- 取该地图名字
	local tips = r.tip
	
	if player:GetItems():GetItemCount(70121) > 0 then
		player:GetItems():RemoveItem(70121,1)
	end
	
	--[[if flag == 0 then
		if player:GetItems():GetFreeSlot(0) > 0 then
			NpcSay("少侠第一次跑镖，送你个梅花针，有时候能派上用场的。")
			player:GetItems():AddItem(28120,1)
			ShowError("\#W获得梅花针")
		else
			NpcSay("少侠把当前道具栏留至少一个空位再来吧。")
			return
		end
	end]]
	
	NpcSay(string.format("这一次的镖银是\#A%s\#W托运的，少侠快去快回，多多保重。", npcName))
	self.descript = string.format("将镖银护送给%s。##%s",npcName,tips)
	self.end_npc = { npc_id = r.npc_id, map_id = r.map_id }
	self.target_npc = { r }
	player:AddBuff(257, 0, 0, 0, 0, 0)
	player:ChangeVP(-2)
	AddQuest(self)
end

-- Quest30602 交回任务方法
function Quest30602:Return()
    if player:GetQuests():TimeMarkOver(306, 1) == false then
		NpcSay("这人太多,忙不过来,少侠还是排队,等会再来吧。当前押镖间隔至少1分钟。")
		return 
	end
 
    if IsProcess() then
	script:SetSaying(true)
		--[[if player:GetItems():GetItemCount(70121) < 1 then
			NpcSay("镖车呢？镖车哪去了？")
			return
		end]]
		local money = 0
		if LuaI.GetRealWDay() == 6 then
			money = 15000*2
		else
			money = 10000*2
		end
		local amoney = 25000
		local flag = player:GetQuests():GetFlag(306)
		NpcSay("少侠辛苦了，这是酬劳请收下。")
		player:ChangeSMoney(money,306)
		player:ChangeMoney(amoney,306)
		RemoveQuest(self)
		player:GetItems():RemoveItem(70121,1)
		player:RemoveBuff(257)
	    player:GetQuests():RemoveTimeMark(306)
		ShowError(string.format("\#W获得储备金%d",money))
		ShowError(string.format("\#W获得银两%d",amoney))
		player:GetQuests():SetFlag(306,flag+1)
		player:SetFull(true, true, false, false)
		player:GetPartners():SetAllFull(true, true, true)
		local qtype = player:GetQuests():GetType(221)
		if qtype == nil then
			player:GetQuests():SetRoundInfo(221, 1, 1, 2)
			qtype = player:GetQuests():GetType(221)
		end
		if qtype:GetLimitType() == 7 then
			player:GetQuests():SetRoundInfo(221, 1, 1, 2)
		end
		if math.random(1,200) <= 25 and player:GetItems():GetFreeSlot(0) > 0 and qtype:GetTotalRound() < 1 then
			local item = RandTable({51300,51301,51302,51304,51305,51306,51307,51308,51310,51311})player:GetItems():AddItem(item,1)
			qtype:SetTotalRound(1)
			ShowError(string.format("\#W获得%s",GetItemName(item)))
			script:Rumor(string.format("一本破书把押镖押得昏昏欲睡的 %s \#O砸醒，竟然是一本\#B%s\#O。",player:GetCharNameLink(),GetItemName(item)), false)
		end
	end	
end

-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest30602)
