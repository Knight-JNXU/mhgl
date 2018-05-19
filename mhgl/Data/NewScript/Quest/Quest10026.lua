--HULA
Quest10026 = {
	quest_id = 10026,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "问问看#R\管家\#W,李善人的病到底是怎么回事~。",
	require = { 
	},
	
	target_npc = { {npc_id=7, map_id=1}},
	end_npc = {npc_id=7, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10026:Take()
	if not player:GetQuests():HasQuest(10026) then
		ISay("开心了吧,快点告诉我,你撞鬼的情形到底怎样嘛？")
		NpcSay("既然已经吃到了烤鸭，我就和你实话说吧。其实我根本没有去抓鬼，最近找我算命做法的人实在太少了，又恰巧想起东海湾闹鬼的传闻，就撒谎说建邺城也在闹鬼，本想着大家被我这么一吓，做法驱邪的人也多些，可生意还是那么差。")
		ISay("坏人,骗我,那也就是说,建邺城闹鬼这事儿,全是您杜撰出来吓唬人的咯！ ")
		NpcSay("其实,也不能完全这么说,至少李善人的病,似乎正是因这闹鬼的传闻而起,少侠不妨去问问他的#Y管家？")
		if IsProcess() then
			AddQuest(Quest10026)
		end
		return true
	else		
		return false
	end
end

function Quest10026:Return()
	if QuestCompleted(self) then
		ShowError("\#W获得经验值2000")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetQuests():RemoveQuest(10026)
		end
		return true
	else	
		NpcSay("找到\#B烤鸭\#W了吗？")
		return false
	end
end





















AddQuestTable(Quest10026)
