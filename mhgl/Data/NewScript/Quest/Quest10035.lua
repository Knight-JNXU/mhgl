--HULA


Quest10035 = {
	quest_id = 10035,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "金山寺",
	descript = "把香交给\#B酒肉和尚\#W,帮助吴老爹传达心愿给佛珠吧~！",
	tips = "\#B香\#W可以在长安城福寿店买到",
	require = {},
	target_item = { {item_id=30024, count=1} },
	end_npc = {npc_id=514, map_id=101},
	feature = {"nocancel"},		
}

function Quest10035:Take()
	if not player:GetQuests():HasQuest(10035) then		
		NpcSay("#A香#W可以在长安城福寿店买到,有劳了~！")
		if IsProcess() then
			AddQuest(Quest10035)
		end
		return true
	else
		return false
	end			
end

function Quest10035:Return()
	if QuestCompleted(self) then
		NpcSay("哼哼,又是来找玄奘法师的,我有哪一点比不上他,先见他,先打过我,我就让你去见他~！")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(30024,1)
			player:GetQuests():RemoveQuest(10035)
		end
		return true
	else	
		NpcSay("少侠是来上香的吗?直接把香给我就好了~！")
		return false
	end
end

AddQuestTable(Quest10035)

