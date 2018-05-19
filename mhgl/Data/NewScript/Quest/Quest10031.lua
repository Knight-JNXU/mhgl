--HULA
Quest10031 = {
	quest_id = 10031,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "寻找白鹿",
	descript = "南极仙翁的坐骑\#A白鹿\#W不见了,快帮他在附近找找吧。",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A白鹿\#W”就可以自动寻路至\#A白鹿\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=136, map_id=14} },
	end_npc = {npc_id=136, map_id=14},
	feature = {"nocancel"},	
}

function Quest10031:Take()
	local flag = player:GetQuests():GetFlag(10031)
	if not player:GetQuests():HasQuest(10031) and flag == 1 then
		local pname = player:GetName()
		ISay("到附近转转,说不定\#A白鹿就在附近。")
		if IsProcess() then
			AddQuest(Quest10031)			
			player:HandleGuideEvent(4);
		end
		return true
	else
		return false
	end
end

function Quest10031:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		NpcSay(string.format("%s，你竟然敬酒不吃吃罚酒,今天就让你见识见识我的厉害~~~！！！", player:GetName())) 
		if IsProcess() then
			player:GetQuests():SetFlag(10031, 2)
			player:GetQuests():RemoveQuest(10031)
		end
		return true	
	else
		ISay("得赶快帮南极仙翁找到\#A白鹿\#W。")
		return false
	end
end

AddQuestTable(Quest10031)
