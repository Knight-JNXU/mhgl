--HULA


Quest10041 = {
	quest_id = 10041,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "寻找餐风饮露",
	descript = "这定神香需要\#B餐风饮露\#W才能制作出来,附近到处转转,说不定可以收获一些~！",
	tips = "\#B餐风饮露\#W可以野怪掉落,也可以在长安城商会总管处购买到",
	require = {},
	target_item = { {item_id=10044, count=1} },
	end_npc = {npc_id=76, map_id=8},
	feature = {"nocancel"},		
}

function Quest10041:Take()
	if not player:GetQuests():HasQuest(10041) then		
		if IsProcess() then
			AddQuest(Quest10041)
		end
		return true
	else
		return false
	end			
end

function Quest10041:Return()
	if QuestCompleted(self) then
		NpcSay("这么快就找到啦,各位稍等我一下,我这就去炼制！")
		NpcSay("......")
		NpcSay("诺,火候很好,这就是你们要得定神香,赶快拿去救人吧~！")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():AddItem(10048,1)
			player:GetItems():RemoveItem(10044,1)
			player:GetQuests():RemoveQuest(10041)
		end
		return true
	else	
		NpcSay("这定神香可是神丹妙药,吃了可安神定魂,可惜需要这仙草餐风饮露来进行炼制,你们找到了吗?")
		return false
	end
end

AddQuestTable(Quest10041)

