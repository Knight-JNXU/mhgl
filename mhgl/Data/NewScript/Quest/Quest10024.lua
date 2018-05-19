--HULA
Quest10024 = {
	quest_id = 10024,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "赶快帮\#A王大嫂\#W找到\#B四叶花\#W吧。",
	tips = "\#B四叶花\#W在东海湾野外战斗野怪胜利可有一定几率获得。",
	require = { 
	},
	end_npc = {npc_id=19, map_id=1},	
	target_item = { {item_id=10000, count=1} },
	feature = {"nocancel"},	
}

function Quest10024:Take()
	if not player:GetQuests():HasQuest(10024) then
		ISay("小事情,我这就帮你去寻\#B四叶花\#W来")
		if IsProcess() then
			AddQuest(Quest10024)
		end
		return true
	else		
		return false
	end
end

function Quest10024:Return()
	if QuestCompleted(self) then
		NpcSay("幸好你来得及时，否则我丈夫命丧了。奖励你经验值2000。")
		ShowError("\#W获得经验值2000")
		ShowError("\#W获得烤鸭")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(10000,1)
			player:GetItems():AddItem(10053, 1)
			player:GetQuests():RemoveQuest(10024)
		end
		return true
	else	
		NpcSay("找到\#B四叶花\#W了吗？")
		return false
	end
end





















AddQuestTable(Quest10024)
