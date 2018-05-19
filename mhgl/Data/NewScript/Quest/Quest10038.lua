--HULA
Quest10038 = {
	quest_id = 10038,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "化生寺的烦恼",
	descript = "\#A玄奘法师\#W被酒肉和尚打伤了,精神受到了很大的压迫,胡言乱语,快去化生寺找\#A法明长老\#W问问看~",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A法明长老\#W”就可以自动寻路至\#A法明长老\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=536, map_id=102} },
	end_npc = {npc_id=536, map_id=102},
	feature = {"nocancel"},	
}

function Quest10038:Take()
	if not player:GetQuests():HasQuest(10038) then
		local pname = player:GetName()
		ISay("法明长老就在化生寺的\#A光华殿#W内,事不宜迟,赶快出发吧~！")
		if IsProcess() then
			AddQuest(Quest10038)			
		end
		return true
	else
		return false
	end
end

function Quest10038:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
	  ISay("法明长老........")
	  NpcSay(".........")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10038)
		end
		return true	
	else
		ISay("得赶快找到\#A法明长老\#W。")
		return false
	end
end

AddQuestTable(Quest10038)
