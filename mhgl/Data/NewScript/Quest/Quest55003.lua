--耳朵
Quest55002 = {
	quest_id = 55002,				-- quest ID
	type_id = 550,					-- type ID
	type_name = "帮派任务",
	name = "发展任务",
	feature = {"cancel"},	
	round_info = {max_round = 10, limit_round = 100, limit_type = 1}, 
	time_mark = 550,  
}

function Quest55002:Take()
	if not CanAddRound(self.type_id) then
		NpcSay("休息下吧，帮派发展靠大家，别把自己累坏了。")
		return
	end
	if player:GetQuests():TimeMarkOver(550, 1) == false then
		NpcSay("取消任务后\#G10\#W分钟才能再次领取任务。")
		return 
	end
	if IsProcess() then
		script:SetSaying(true)
		local moblist = {}
		if player:GetLevel() < 40 then
			moblist = { 	
					{mob_id=1,map_id=2},		
					{mob_id=2,map_id=2},	
					{mob_id=3,map_id=3},	
					{mob_id=4,map_id=2},	
					{mob_id=5,map_id=4},
					{mob_id=21,map_id=6},
					{mob_id=18,map_id=6},
					{mob_id=24,map_id=8},
					{mob_id=27,map_id=8},
					{mob_id=30,map_id=8}}
		elseif player:GetLevel() < 60 then
			moblist = { 	
					{mob_id=1,map_id=2},		
					{mob_id=2,map_id=2},	
					{mob_id=3,map_id=3},	
					{mob_id=4,map_id=2},	
					{mob_id=5,map_id=4},
					{mob_id=21,map_id=6},
					{mob_id=18,map_id=6},
					{mob_id=24,map_id=8},
					{mob_id=27,map_id=8},
					{mob_id=30,map_id=8}}
		elseif player:GetLevel() < 80 then
			moblist = { 	
					{mob_id=1,map_id=2},		
					{mob_id=2,map_id=2},	
					{mob_id=3,map_id=3},	
					{mob_id=4,map_id=2},	
					{mob_id=5,map_id=4},
					{mob_id=21,map_id=6},
					{mob_id=18,map_id=6},
					{mob_id=24,map_id=8},
					{mob_id=27,map_id=8},
					{mob_id=30,map_id=8}}
		elseif player:GetLevel() < 180 then	
			moblist = { 	
					{mob_id=1,map_id=2},		
					{mob_id=2,map_id=2},	
					{mob_id=3,map_id=3},	
					{mob_id=4,map_id=2},	
					{mob_id=5,map_id=4},
					{mob_id=21,map_id=6},
					{mob_id=18,map_id=6},
					{mob_id=24,map_id=8},
					{mob_id=27,map_id=8},
					{mob_id=30,map_id=8}}
		end
		local r = RandTable(moblist)
		local mapName = GetMapName(r.map_id)
		local partner = GetMobName(r.mob_id)
		
		NpcSay(string.format("最近有不少帮众反应被%s欺负了，你去抓一个回来，给点颜色他们看看。",partner))
		self.descript = string.format("去\#P%s\#W擒拿一个\#O%s#W回来。", mapName,partner)
		self.end_npc = { npc_id = npc:GetNpc_id(), map_id = npc:GetMap_id()}
		self.target_partner = {{ mob_id = r.mob_id}}
		AddQuest(self)
	end
end

function Quest55002:Return()
	if not QuestCompleted(self) then 
		NpcSay("人抓回来了吗？")
	    return false 
	end
	
	local qtype = player:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end
	local quest = player:GetQuests():GetQuest(self.quest_id)
	local mob_id = quest:GetTargetPartnerId(1)
	local reqTbl = { {gtype = 2, gid = mob_id}} 
	local partner = GetMobName(mob_id)
	local givenMsg = "请将任务需求的同伴放入给予界面"
	local success = AskGiven(givenMsg, reqTbl)
	local round = qtype:GetRound() 
    local lv = player:GetLevel()
	local Aura = player:GetGuild():GetAura()
	local Exp =  (4*lv+10)*6.6*15*(1.2+1.6*round)/10
	local rate = 1 + 3.5*Aura
	local GuildDonate = 10
	if round < 7 then
		GuildDonate = 10
	else
		GuildDonate = round + 10
	end		
	if player:HasBuff(279) then
		GuildDonate = GuildDonate * 2
	end
	if player:HasBuff(300) then
		GuildDonate = GuildDonate * 3
	end
	if IsProcess() then		
		if not success then
			return false
		end
		script:SetSaying(true)
		local q = math.random(1,100)
		if q <= rate then
			NpcSay("由于山庄灵气值的影响，你获得的经验和帮贡为平时的\#G2\#W倍。")
			Exp = 2 * Exp
			GuildDonate = 2 * GuildDonate
		else
			NpcSay("不错不错，帮派的发展是要靠各位帮众一起努力的。")
		end
		local Guild = player:GetGuild()
    local Prosper = 1
    if round < 5 then
      Prosper = 10
    elseif round < 8 then
      Prosper = 15
    elseif round < 10 then
      Prosper = 20
    else
      Prosper = 25
    end
		player:ChangeExp(Exp,550)
		player:GetGuild():ChangeMaterial(round)
		player:ChangeGDonate(GuildDonate, 4)
		ShowError(string.format("\#W获得经验值%d",Exp))
		ShowError(string.format("\#W获得帮贡%d",GuildDonate))
		ShowError(string.format("\#W山庄建材增加%d",round))	
		Guild:ChangeProsper(Prosper)
		if Guild:GetProsper() == Guild:GetMax_prosper() then
		  ShowError("#W当前山庄繁荣度已达上限")
		else
		  ShowError(string.format("#W山庄繁荣度增加%d", Prosper))
		end
		RemoveAllGiven()
		RemoveQuest(self)
		player:GetQuests():RemoveTimeMark(550)		
		if round >= qtype:GetMaxRound() then
			qtype:SetRound(0)
		end	
	end
end
AddQuestTable(Quest55002)