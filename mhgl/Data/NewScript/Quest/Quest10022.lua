--HULA
Quest10022 = {
	quest_id = 10022,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "近日听说沉船闹鬼，得向\#A孙老头\#W已经找道士前去调查,快去找\#A牛大胆\#W问问具体情况在做对策~~。",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P牛大胆（建邺城：143，87）\#W”可直接自动寻路到牛大胆跟前。",
	require = { 
	},
	target_npc = { {npc_id=25, map_id=1}},
	end_npc = {npc_id=25, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10022:Take()
	if not player:GetQuests():HasQuest(10022) then
		NpcSay("前几日我已经召集道士前期沉船查看,你前去帮我问问\#A牛大胆\#W问问具体情况吧。")
		if IsProcess() then
			AddQuest(Quest10022)
		end
		return true
	else		
		return false
	end
end

function Quest10022:Return()
	if player:GetQuests():HasQuest(10022) and npc:GetNpc_id() == 25 then
		ISay("骗吃骗喝的道士,沉船闹鬼,又去骗钱了？")
		NpcSay("你个小娃娃懂什么~这沉船的鬼可不是一般人能够降服的了,给你说了也是白说~!想要听我讲述那晚的情况,没有好处可不行~~~")
		ISay("哼,你想要什么好处?")
		NpcSay("这建邺城王大嫂做的烤鸭可是出了名的好吃,若是你能给我买一个过来,我就满足你的愿望~~~")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
			player:GetQuests():RemoveQuest(10022)
			player:HandleGuideEvent(13);
		end
		return true
	else
		NpcSay("赶快去\#A王大嫂\#W买一个烤鸭给我~~。")
		return false
	end
end

AddQuestTable(Quest10022)
