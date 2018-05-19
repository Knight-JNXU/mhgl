--HULA

Quest10013 = {
	quest_id = 10013,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "替陈长寿传个口讯给钱庄老板\#A钱庄老板\#W。",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P钱庄老板（万宇钱庄）",
	require = { 
	},
	target_npc = { {npc_id=442, map_id=56}},
	end_npc = {npc_id=442, map_id=56},
	feature = {"nocancel"},		
}

function Quest10013:Take()
	if not player:GetQuests():HasQuest(10013) then
		NpcSay("阁下仗义助人，老朽就烦你再跑一趟钱庄，去找老板\#A钱庄老板\#W，告诉他我一会要取一笔银子，请他早做准备。 ")
		if IsProcess() then
			AddQuest(Quest10013)
		end
		return true
	else		
		return false
	end
end

function Quest10013:Return()
	if player:GetQuests():HasQuest(10013) and npc:GetNpc_id() == 442 then
		NpcSay("你放心！银子早已准备妥当！奖励你经验值800。")
		ShowError("\#W获得经验值800")
		if IsProcess() then
			player:ChangeExp(800,1)
			player:GetQuests():RemoveQuest(10013)
			player:HandleGuideEvent(19);
		end
		return true
	else
		NpcSay("麻烦你替我转告钱庄老板\#A钱庄老板\#W，呆会我会去他的钱庄取一笔银子，请他先准备好。")
		return false
	end
end

AddQuestTable(Quest10013)