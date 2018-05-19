--HULA


Quest10046 = {
	quest_id = 10046,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "寻找镇寺之宝",
	descript = "这化生寺的镇寺之宝\#B佛光舍利子\#W被盗走,的赶紧找到镇寺之宝给空慈方丈送回去~！",
	tips = "\#B佛光舍利子\#W可以在建邺城药店购买到",
	require = {},
	target_item = { {item_id=10008, count=1} },
	end_npc = {npc_id=244, map_id=28},
	feature = {"nocancel"},		
}

function Quest10046:Take()
	if not player:GetQuests():HasQuest(10046) then		
		if IsProcess() then
			AddQuest(Quest10046)
		end
		return true
	else
		return false
	end			
end

function Quest10046:Return()
	if QuestCompleted(self) then
		NpcSay("施主能收服琉璃女,果真颇有缘分，这这些不成敬意(25000两银子),还望施主收纳！")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(10008,1)
			player:GetQuests():RemoveQuest(10046)
		end
		return true
	else	
		NpcSay("唉,这镇寺之宝#B佛光舍利子#W被这女妖夺走,这可如何是好~！")
		return false
	end
end

AddQuestTable(Quest10046)

