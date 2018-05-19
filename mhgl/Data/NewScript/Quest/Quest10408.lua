--耳朵
Quest10408 = {
	quest_id = 10408,				-- quest ID
	type_id = 5501,					-- type ID
	type_name = "苦行虚空",
	name = "寻找食物",
	feature = {"cancel"},	
	time_mark = 550,  
}

function Quest10408:Take()
	if not CanAddRound(self.type_id) then
		NpcSay("休息下吧，帮派发展靠大家，别把自己累坏了。")
		return
	end
	if IsProcess() then
		script:SetSaying(true)
		local moblist = {}
			moblist = { 	
					{mob_id=1,map_id=252},		
					{mob_id=4,map_id=252},	
					{mob_id=10,map_id=252}}
		local r = RandTable(moblist)
		local mapName = GetMapName(r.map_id)
		local partner = GetMobName(r.mob_id)
		
		NpcSay(string.format("到附近转转,给我抓一只#P%s#W回来下酒喝#46。",partner))
		self.descript = string.format("去\#P%s\#W擒拿一个\#O%s#W回来。", mapName,partner)
		self.end_npc = { npc_id = npc:GetNpc_id(), map_id = npc:GetMap_id()}
		self.target_partner = {{ mob_id = r.mob_id}}
		AddQuest(self)
	end
end

function Quest10408:Return()
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
	local flag = player:GetQuests():GetFlag(300098)
	if IsProcess() then		
		if not success then
			return false
		end
		script:SetSaying(true)
		player:GetQuests():SetFlag(300098,flag + 1)	
		ShowHint("满意度增加1点")
		RemoveAllGiven()
		RemoveQuest(self)
		player:GetQuests():RemoveTimeMark(550)		
		if round >= qtype:GetMaxRound() then
			qtype:SetRound(0)
		end	
	end
end
AddQuestTable(Quest10408)