--HULA
Quest10034 = {
	quest_id = 10034,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "吴老爹的烦恼",
	descript = "吴老爹想到\#A金山寺\#W上香,但是腿脚不利索,少侠前去问问他有什么心愿吧~",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A吴老爹\#W”就可以自动寻路至\#A吴老爹\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=178, map_id=19} },
	end_npc = {npc_id=178, map_id=19},
	feature = {"nocancel"},	
}

function Quest10034:Take()
	local flag = player:GetQuests():GetFlag(10031)
	if not player:GetQuests():HasQuest(10034) and flag == 2 then
		if IsProcess() then
			AddQuest(Quest10034)			
			player:HandleGuideEvent(4);
		end
		return true
	else
		return false
	end
end

function Quest10034:Return()
	if QuestCompleted(self) then
		NpcSay(string.format("%s最近心里很是烦躁,少侠帮我去金山寺上一注香吧,有劳了~", player:GetName())) 
		if IsProcess() then
			player:GetQuests():SetFlag(10031, 3)
			player:GetQuests():RemoveQuest(10034)
		end
		return true	
	else
		ISay("到长安城买一注香,然后帮助\#A吴老爹\#W到金山寺上香~")
		return false
	end
end

AddQuestTable(Quest10034)
