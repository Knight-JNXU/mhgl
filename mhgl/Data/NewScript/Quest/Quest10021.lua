--HULA
Quest10021 = {
	quest_id = 10021,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "近日听说沉船闹鬼，得向\#A孙老头\#W问问具体的情况在说~~。",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P孙老头（建邺城：140，30）\#W”可直接自动寻路到孙老头跟前。",
	require = { 
	},
	target_npc = { {npc_id=21, map_id=1}},
	end_npc = {npc_id=21, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10021:Take()
	if not player:GetQuests():HasQuest(10021) then
		NpcSay("近日听说沉船闹鬼,孙老头也召集了道士前去驱鬼,快找\#A孙老头\#W问问具体情况吧。")
		if IsProcess() then
			AddQuest(Quest10021)
		end
		return true
	else		
		return false
	end
end

function Quest10021:Return()
	if player:GetQuests():HasQuest(10021) and npc:GetNpc_id() == 21 then
		NpcSay("近日沉船闹鬼,这可耽误了我们城的收入,前几日寻找过道士全区查看,不知道调查的如何了,你帮忙过去问问牛大胆吧~!")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
			player:GetQuests():RemoveQuest(10021)
			player:HandleGuideEvent(13);
		end
		return true
	else
		NpcSay("赶快去问问\#A孙老头\#W沉船闹鬼的情况吧。")
		return false
	end
end

AddQuestTable(Quest10021)
