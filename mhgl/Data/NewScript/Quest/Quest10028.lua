--HULA
Quest10028 = {
	quest_id = 10028,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "终于找到地狱灵芝了,事不宜迟,赶快交给\#B管家\#W吧。",
	require = { 
	},
	end_npc = {npc_id=7, map_id=1},	
	target_item = { {item_id=10043, count=1} },
	feature = {"nocancel"},	
}

function Quest10028:Take()
	if not player:GetQuests():HasQuest(10028) then
		if IsProcess() then
			AddQuest(Quest10028)
		end
		return true
	else		
		return false
	end
end

function Quest10028:Return()
	if QuestCompleted(self) then
		ShowError("\#W获得经验值2000")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetQuests():RemoveQuest(10028)
      player:GetItems():RemoveItem(10043,1)
		end
		return true
	else	
		NpcSay("找到\#B地狱灵芝\#W了吗？")
		return false
	end
end





















AddQuestTable(Quest10028)
