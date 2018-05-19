--HULA
Quest10039 = {
	quest_id = 10039,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "化生寺的烦恼",
	descript = "\#A法明长老\#W似乎受了一点伤,赶快问问小和尚\#A慧明\#W到底怎么回事吧~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A慧明\#W”就可以自动寻路至\#A慧明\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=535, map_id=102} },
	end_npc = {npc_id=535, map_id=102},
	feature = {"nocancel"},	
}

function Quest10039:Take()
	if not player:GetQuests():HasQuest(10039) then
		local pname = player:GetName()
	  ISay("法明长老似乎受了伤,问问一旁的慧明到底怎么回事儿！")
		if IsProcess() then
			AddQuest(Quest10039)			
		end
		return true
	else
		return false
	end
end

function Quest10039:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
	  NpcSay("虽说咱们化生寺的医术天下精明,但是要医治法明长老的伤势,必须需要#P定神香#W做药引子才行~！")
	  ISay("那在哪里才可以找到呢?")
	  NpcSay("此药听说#Y花果山#W的#P侯医生#W有研究~")
	  ISay("小事一桩,包在我身上~")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10039)
		end
		return true	
	else
		ISay("得赶快找到\#A法明长老\#W。")
		return false
	end
end

AddQuestTable(Quest10039)
