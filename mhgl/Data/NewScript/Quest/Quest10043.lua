--HULA
Quest10043 = {
	quest_id = 10043,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "寻找空慈方丈",
	descript = "法明长老服下了定神香之后好多了,赶快去后院问问\#A空慈方丈\#W那女妖的来历~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A空慈方丈\#W”就可以自动寻路至\#A空慈方丈\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=244, map_id=28} },
	end_npc = {npc_id=244, map_id=28},
	feature = {"nocancel"},	
}

function Quest10043:Take()
	if not player:GetQuests():HasQuest(10043) then
		local pname = player:GetName()
		if IsProcess() then
			AddQuest(Quest10043)			
		end
		return true
	else
		return false
	end
end

function Quest10043:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		  NpcSay("这妖女不简单,此招式应该不是来之凡间,你们不妨去天界问问~！")
		  NpcSay("这守门天兵可不是什么善茬,喜欢玩闹,少侠可要打赢了他,才会得到想要的答案~！")
		  ISay("我们这就去天界~~~")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10043)
		end
		return true	
	else
		ISay("得赶快去天宫问问\#A守门天兵\#W。")
		return false
	end
end

AddQuestTable(Quest10043)
