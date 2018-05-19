--HULA


Quest10011 = {
	quest_id = 10011,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "牛二似乎中了毒，情况不太妙，先去帮他找来一株\#B四叶花\#W再说。",
	tips = "\#B四叶花\#W在野外遇到头领敌人时会有几率得到。\#P东海湾\#W的\#O巨蛙\#W和\#P东海湾\#W的\#O大海龟\#W身上也可能带有四叶花。",
	require = {},
	target_item = { {item_id=10000, count=1} },
	end_npc = {npc_id=35, map_id=2},
	feature = {"nocancel"},		
}

function Quest10011:Take()
	if not player:GetQuests():HasQuest(10011) then		
		NpcSay("感谢阁下相助，但我现在身中剧毒，可否立马帮我找一株\#B四叶花\#W来？")
		if IsProcess() then
			AddQuest(Quest10011)
		end
		return true
	else
		return false
	end			
end

function Quest10011:Return()
	if QuestCompleted(self) then
		NpcSay("幸好你来得及时，否则我就命丧于此了。奖励你经验值2000。")
		ShowError("\#W获得经验值2000")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(33000,1)
			player:GetQuests():RemoveQuest(10011)
		end
		return true
	else	
		NpcSay("找到\#B四叶花\#W了吗？")
		return false
	end
end

AddQuestTable(Quest10011)

