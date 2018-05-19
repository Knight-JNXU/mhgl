--HULA
Quest10044 = {
	quest_id = 10044,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "打听消息",
	descript = "从空慈方丈口中得出女妖估计是来之天界,赶快去找守门天兵打听打听女妖的消息吧~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A守门天兵\#W”就可以自动寻路至\#A守门天兵\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=116, map_id=13} },
	end_npc = {npc_id=116, map_id=13},
	feature = {"nocancel"},	
}

function Quest10044:Take()
	if not player:GetQuests():HasQuest(10044) then
		local pname = player:GetName()
		if IsProcess() then
			AddQuest(Quest10044)			
		end
		return true
	else
		return false
	end
end

function Quest10044:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		  NpcSay("这天宫的日子也是够无聊的,你有很多问题?那好,看我把你脑袋里的问号打成句号~！")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10044)
		end
		return true	
	else
		ISay("得赶快去天宫问问\#A守门天兵\#W。")
		return false
	end
end

AddQuestTable(Quest10044)
