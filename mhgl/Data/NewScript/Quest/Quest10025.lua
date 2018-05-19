--HULA
Quest10025 = {
	quest_id = 10025,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "终于找到烤鸭了,趁热快交给\#B牛大胆\#W吧。",
	require = { 
	},
	end_npc = {npc_id=25, map_id=1},	
	target_item = { {item_id=10053, count=1} },
	feature = {"nocancel"},	
}

function Quest10025:Take()
	if not player:GetQuests():HasQuest(10025) then
		ISay("看到你们一家人能够幸福平安,我也就放心了,另外我想要买一个烤鸭")
		NpcSay("买什么买,救民恩人还用得着花钱吗，这里的烤鸭随便拿随便吃~~~")
		ISay("那我就不客气了~~~~~~(*^__^*) ")
		if IsProcess() then
			AddQuest(Quest10025)
		end
		return true
	else		
		return false
	end
end

function Quest10025:Return()
	if QuestCompleted(self) then
		ShowError("\#W获得经验值2000")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(10053,1)
			player:GetQuests():RemoveQuest(10025)
		end
		return true
	else	
		NpcSay("找到\#B四叶花\#W了吗？")
		return false
	end
end





















AddQuestTable(Quest10025)
