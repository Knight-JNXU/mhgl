--HULA
Quest10037 = {
	quest_id = 10037,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "玄奘法师身世",
	descript = "终于搞定了\#A酒肉和尚\#W,快去看看玄奘法师到底怎么样了吧",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A玄奘法师\#W”就可以自动寻路至\#A玄奘法师\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=516, map_id=101} },
	end_npc = {npc_id=516, map_id=101},
	feature = {"nocancel"},	
}

function Quest10037:Take()
	if not player:GetQuests():HasQuest(10037) then
		local pname = player:GetName()
		ISay("赶快去看看\#A玄奘法师#W到底怎么样了")
		if IsProcess() then
			AddQuest(Quest10037)			
		end
		return true
	else
		return false
	end
end

function Quest10037:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
	  NpcSay("%$#@@^^%#$#@!!#$一二三四五六七#%@@！！七六五四三二一")
	  ISay("看来玄奘法师脑子出了一点问题,去化生寺找法明长老帮帮忙吧")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10037)
		end
		return true	
	else
		ISay("得赶快去看看#A玄奘法师\#W怎么样了~！")
		return false
	end
end

AddQuestTable(Quest10037)
