--HULA
Quest10004 = {
	quest_id = 10004,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "别过宠物仙子，到\#P建邺城\#W去找\#A陈长寿\#W他老人家听说你要走了,挺挂念你的。",
	tips = "在建邺城的东北边，TAB打开小地图点击\#A陈长寿\#W自动寻路。",
	require = { 
	},
	target_npc = { {npc_id=20, map_id=1}},
	end_npc = {npc_id=20, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10004:Take()
	if not player:GetQuests():HasQuest(10004) then
		NpcSay("我能教的你已都会了。上路前你也该备些药材，这岛上数\#A陈长寿\#W最精通医理，你向他去告个别吧！江湖不似这小城，若说错一句话，做错一件事，顷刻间便会血雨腥风！日后万事小心！")
		if IsProcess() then
			AddQuest(Quest10004)
			player:HandleGuideEvent(11);
		end
		return true
	else		
		return false
	end
end

function Quest10004:Return()
	if player:GetQuests():HasQuest(10004) and npc:GetNpc_id() == 20 then
	local freeSlot = player:GetItems():GetFreeSlot(0)
		if freeSlot >= 2 then
			ISay("听闻陈长寿是这岛上最精通药理之人，晚辈特来请教一二！")
			NpcSay("小儿心诚，给你点见面礼！奖励你经验值400，四叶花30个，紫丹罗30个。")
			ShowError("\#W获得经验值400")
			ShowError("\#W获得四叶花x30，紫丹罗x30")
			if IsProcess() then
				player:ChangeExp(400,1)
				player:GetItems():AddItem(10000, 30)
				player:GetItems():AddItem(10006, 30)
				player:GetQuests():RemoveQuest(10004)
				player:HandleGuideEvent(12);
			end
			return true
		else
			NpcSay("请先清理你的当前包裹，至少预留2个空位。")
			return false			
		end	
	else
		NpcSay("这岛上要数\#A陈长寿\#W陈长寿最精通医理了，你去向他请教一些药物的知识吧。")
		return false
	end
end

AddQuestTable(Quest10004)
