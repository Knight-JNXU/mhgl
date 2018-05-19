--HULA


Quest10042 = {
	quest_id = 10042,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "医治法明长老",
	descript = "定神香终于找到了,得赶快回去交给\#B法明长老\#W服用~！",
	require = {},
	target_item = { {item_id=10048, count=1} },
	end_npc = {npc_id=536, map_id=102},
	feature = {"nocancel"},		
}

function Quest10042:Take()
	if not player:GetQuests():HasQuest(10042) then		
		if IsProcess() then
			AddQuest(Quest10042)
		end
		return true
	else
		return false
	end			
end

function Quest10042:Return()
	if QuestCompleted(self) then
	  ISay("法明长老....")
	  NpcSay("快,先别管我,快去看看空慈方丈如何了~！")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(10048,1)
			player:GetQuests():RemoveQuest(10042)
		end
		return true
	else	
		NpcSay("咳咳........你们找到了定神香了吗?")
		return false
	end
end

AddQuestTable(Quest10042)

