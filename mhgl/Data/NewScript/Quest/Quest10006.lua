--HULA
Quest10006 = {
	quest_id = 10006,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "\#A服装店老板\#W平日里最疼你了，当然得去跟她道个别，顺便也要备些防具呢。",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P服装店老板（李记布庄）",
	require = { 
	},
	target_npc = { {npc_id=449, map_id=58}},
	end_npc = {npc_id=449, map_id=58},
	feature = {"nocancel"},	
}

function Quest10006:Take()
	if not player:GetQuests():HasQuest(10006) then
		NpcSay("武器是你在江湖里的第一个朋友，你有什么不明白的，尽管来问我！出门在外也得做几件衣服带上，你去找\#A服装店老板\#W询问询问吧！")
		if IsProcess() then
			AddQuest(Quest10006)
		end
		return true
	else		
		return false
	end
end

function Quest10006:Return()
	if player:GetQuests():HasQuest(10006) and npc:GetNpc_id() == 449 then
		ISay("我就要走了，今天特地来跟您拜别！")
		NpcSay("呵呵，年轻人志在四方。这建邺城并非久留之所，出去闯闯也好!奖励你经验值400。")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
			player:GetQuests():RemoveQuest(10006)
			player:HandleGuideEvent(14);
		end
		return true
	else
		NpcSay("如果你有幸遇上打造武器的高手，为你打造出绝世神兵，那你扬名江湖也就指日可待了。\#A服装店老板\#W好像有话要对你说，你过去看看吧。")
		return false
	end
end

AddQuestTable(Quest10006)
