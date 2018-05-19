--HULA
Quest10047 = {
	quest_id = 10047,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "玄奘的身世",
	descript = "解决了化生寺的事情,去问问法明长老\#A玄奘法师\#W的身世把~~！！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A空慈方丈\#W”就可以自动寻路至\#A空慈方丈\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=536, map_id=102} },
	end_npc = {npc_id=536, map_id=102},
	feature = {"nocancel"},	
}

function Quest10047:Take()
	if not player:GetQuests():HasQuest(10047) then
		local pname = player:GetName()
		if IsProcess() then
			AddQuest(Quest10047)			
		end
		return true
	else
		return false
	end
end

function Quest10047:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		  NpcSay("当年我在大唐国境的河边捡到玄奘,这是玄奘法师家人留给他的血书,施主拿给玄奘看吧~！阿弥陀佛")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10047)
		end
		return true	
	else
		ISay("得赶快去问问\#A法明长老\#W玄奘法师的身世~！")
		return false
	end
end

AddQuestTable(Quest10047)
