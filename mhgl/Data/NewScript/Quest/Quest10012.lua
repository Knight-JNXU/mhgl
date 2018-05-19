--HULA

Quest10012 = {
	quest_id = 10012,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "还好找到了药材及时让牛二服下，他似乎已经没事了。好人做好底，替他传个口讯给\#A陈长寿\#W吧。牛二刚刚研制出了传送器，可以很快把你传送回建邺城。",
	tips = "从\#A牛二\#W处可快速传送到\#P建邺城\#W上。",
	require = { 
	},
	target_npc = { {npc_id=21, map_id=1}},
	end_npc = {npc_id=21, map_id=1},
	feature = {"nocancel"},		
}

function Quest10012:Take()
	if not player:GetQuests():HasQuest(10012) then
		ISay("你适才似乎中毒不浅，是遭了谁的暗算？")
		NpcSay("前几日，\#O大海龟\#W将我咬伤，我为了医治，就跑这里寻找药材。谁知适才我打瞌睡，竟迷迷糊糊被一条毒蛇咬伤！多亏有你发现，不然这\#P东海湾\#W又要多一具冤魂。我此刻还需休息一会，少侠可否替我捎个口信：替我回村子告诉\#A陈长寿\#W，他要的货我稍后就送到。")
		if IsProcess() then
			AddQuest(Quest10012)
		end
		return true
	else		
		return false
	end
end

function Quest10012:Return()
	if player:GetQuests():HasQuest(10012) and npc:GetNpc_id() == 21 then
		local freeSlot = player:GetItems():GetFreeSlot(0)
		if freeSlot >= 1 then
			ISay("孙老前辈，牛老板托我告诉您，您要的东西他稍后就送到。")
			NpcSay("娃娃你辛苦了！奖励你经验值800")
			ShowError("\#W获得经验值800")
			if IsProcess() then
				player:ChangeExp(800,1)
				player:GetQuests():RemoveQuest(10012)
				player:HandleGuideEvent(18);
			end
			return true
		else
			NpcSay("请先清理你的当前包裹，至少预留1个空位。")
			return false			
		end
	else
		NpcSay("麻烦你先回村子替我告诉陈长寿，他要的货我稍后就送到。")
		return false
	end
end

AddQuestTable(Quest10012)
