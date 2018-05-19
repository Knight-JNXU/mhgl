--HULA


Quest10048 = {
	quest_id = 10048,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "玄奘的身世",
	descript = "终于拿到了\#B玄奘法师的血书\#W赶快拿给玄奘法师看看他的身世吧~！",
	require = {},
	target_item = { {item_id=20047, count=1} },
	end_npc = {npc_id=516, map_id=101},
	feature = {"nocancel"},		
}

function Quest10048:Take()
	if not player:GetQuests():HasQuest(10048) then		
		if IsProcess() then
			AddQuest(Quest10048)
		end
		return true
	else
		return false
	end			
end

function Quest10048:Return()
	if QuestCompleted(self) then
		NpcSay("施主,你说什么?我是谁?我为什么来到这里?")
		ISay("玄奘法师脑子出问题了,问问酒肉和尚到底怎么回事~！")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(20047,1)
			player:GetQuests():RemoveQuest(10048)
		end
		return true
	else	
		NpcSay("施主找到#B血书#W了吗?")
		return false
	end
end

AddQuestTable(Quest10048)

