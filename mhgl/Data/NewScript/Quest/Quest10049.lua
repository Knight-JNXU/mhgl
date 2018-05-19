--HULA
Quest10049 = {
	quest_id = 10049,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "玄奘的身世",
	descript = "玄奘法师脑子好像秀逗了,问问一旁的酒肉和尚怎么回事儿~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A酒肉和尚\#W”就可以自动寻路至\#A酒肉和尚\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=514, map_id=101} },
	end_npc = {npc_id=514, map_id=101},
	feature = {"nocancel"},	
}

function Quest10049:Take()
	if not player:GetQuests():HasQuest(10049) then
		local pname = player:GetName()
		if IsProcess() then
			AddQuest(Quest10049)			
		end
		return true
	else
		return false
	end
end

function Quest10049:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		  NpcSay("哼哼,你问我玄奘脑袋为何秀逗?那是因为中了我的七日丧命...")
		  NpcSay("不好,说漏嘴了~~~~")
		  ISay("原来是你下的毒~！赶紧把解药交出来！！！！")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10049)
		end
		return true	
	else
		ISay("得赶快去天宫问问\#A酒肉和尚\#W。")
		return false
	end
end

AddQuestTable(Quest10049)
