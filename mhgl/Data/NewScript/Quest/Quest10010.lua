--HULA

Quest10010 = {
	quest_id = 10010,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "怪不得最近没有看到牛二，原来是这么回事。去\#P东海湾\#W把\#O大海龟\#W赶走后，再去\#P东海湾\#W告诉\#A牛二\#W吧。",
	tips = "\#O大海龟\#W就在\#P东海湾\#W一带出没，在\#P东海湾\#W上走走应该能遇到他们。点击\#PTab\#W键打开中地图就可找到\#P东海湾\#W具体方位。",
	require = {},
	target_mob = { {mob_id=1, count=3} },
	end_npc = {npc_id=35, map_id=2},
	feature = {"nocancel"},		
}

function Quest10010:Take()
	if not player:GetQuests():HasQuest(10010) then	
		NpcSay("前几日东海湾上来了几个\#O大海龟\#W，似乎在找\#A牛二\#W的麻烦，\#A牛二\#W迫不得已到\#P东海湾\#W躲避起来。你可否出手帮他一次，把这些\#O大海龟\#W赶跑？")	
		if IsProcess() then
			AddQuest(Quest10010)
		end
		return true
	else
		return false
	end			
end

function Quest10010:Return()
	if QuestCompleted(self) then
		NpcSay("你替我赶走了\#O大海龟\#W？谢谢你！奖励你经验值1000。")
		ShowError("\#W获得经验值1000")
		if IsProcess() then
			player:ChangeExp(1000,1)
		--	player:ChangeMoney(100,1)
			player:GetQuests():RemoveQuest(10010)
		end
		return true
	elseif npc:GetNpc_id() == 35 then
		NpcSay("教训了大海龟以后再来找我吧。")
		return false
	else
		NpcSay("教训了大海龟以后再到\#P东海湾\#W去找\#A牛二\#W看看有什么帮忙的，说不定日后你会有求于他。")
		return false
	end
end

AddQuestTable(Quest10010)