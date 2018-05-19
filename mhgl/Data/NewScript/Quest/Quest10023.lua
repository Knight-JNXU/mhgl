--HULA
Quest10023 = {
	quest_id = 10023,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "赶快找王大嫂购买一个烤鸭交给\#B牛大胆\#W吧。",
	tips = "\#B王大嫂\#W在建邺城(88,30)位置处。",
	require = { 
	},
	target_npc = { {npc_id=19, map_id=1}},
	end_npc = {npc_id=19, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10023:Take()
	if not player:GetQuests():HasQuest(10023) then
		NpcSay("想要知道那晚到底发生了什么事情,赶快去帮我买一个\#B烤鸭\#W来")
		if IsProcess() then
			AddQuest(Quest10023)
		end
		return true
	else		
		return false
	end
end

function Quest10023:Return()
	if player:GetQuests():HasQuest(10023) and npc:GetNpc_id() == 19 then
		NpcSay("唉~唉~唉~")
		ISay("王大嫂,生意不是挺好的，叹什么气啊?")
		NpcSay("我家丈夫已经生病卧床很久了，需要药引子\#B四叶花\#W才可以进行医治~~~")
		ShowError("\#W获得经验值400")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
			player:GetQuests():RemoveQuest(10023)
			player:HandleGuideEvent(13);
		end
		return true
	else
		NpcSay("赶快去\#A王大嫂\#W买一个烤鸭给我~~。")
		return false
	end
end

AddQuestTable(Quest10023)
