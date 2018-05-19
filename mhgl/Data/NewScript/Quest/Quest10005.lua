--HULA
Quest10005 = {
	quest_id = 10005,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "赤手空拳自然难敌刀剑，得向精通兵刃的\#A马全有\#W多多讨教兵刃方面的知识，免得以后吃了亏。",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P马全有（建邺城：32，325）\#W”可直接自动寻路到马全有跟前。",
	require = { 
	},
	target_npc = { {npc_id=11, map_id=1}},
	end_npc = {npc_id=11, map_id=1},	
	feature = {"nocancel"},	
}

function Quest10005:Take()
	if not player:GetQuests():HasQuest(10005) then
		NpcSay("这药品是江湖人士必不可少的，日常出门一定要备一点。你既要离开建邺城，也该选件趁手的兵器，\#A马全有\#W对兵器很有一套，你不妨去向他讨教讨教。")
		if IsProcess() then
			AddQuest(Quest10005)
		end
		return true
	else		
		return false
	end
end

function Quest10005:Return()
	if player:GetQuests():HasQuest(10005) and npc:GetNpc_id() == 11 then
		ISay("我就要离开建邺城去江湖里见识见识去了。您给我说解下武器的知识吧!")
		NpcSay("你这娃儿倒是心怀远志！奖励你经验值400。")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
			player:GetQuests():RemoveQuest(10005)
			player:HandleGuideEvent(13);
		end
		return true
	else
		NpcSay("我能教你的就这些了，\#A马全有\#W对兵器很有一套，你不妨去向他请教请教。")
		return false
	end
end

AddQuestTable(Quest10005)
