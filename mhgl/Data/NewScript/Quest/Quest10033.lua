--HULA


Quest10033 = {
	quest_id = 10033,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "寻找百色花",
	descript = "这老头还真是蛮不讲理呀,不管怎么说,还是先帮他找到\#B百色花\#W再说。",
	tips = "\#B百色花\#W在长安城药店可以购买。",
	require = {},
	target_item = { {item_id=10014, count=1} },
	end_npc = {npc_id=562, map_id=108},
	feature = {"nocancel"},		
}

function Quest10033:Take()
	if not player:GetQuests():HasQuest(10033) then		
		NpcSay("这还是我的白鹿吗?怎么全身血红?可怜我的坐骑啊")
		ISay("这白鹿调皮,不肯跟我回来,于是我动用了一些武力")
		NpcSay("不行,你必须帮我找来#P百色花#W来医治我的白鹿,不然我一把年龄,每天走路,尊老爱幼你可知道?")
		ISay("#%@!...%#!...%#@@!!...@...@#$%!...")
		if IsProcess() then
			AddQuest(Quest10033)
		end
		return true
	else
		return false
	end			
end

function Quest10033:Return()
	if QuestCompleted(self) then
		NpcSay("幸亏你找来的及时,在晚一点我的白鹿可小命不保了~")
		NpcSay("最近大唐国境的#Y吴老爹#W需要找人帮忙上香,少侠不放去看看?")
		ShowError("\#W获得经验值2000")
		if IsProcess() then
			player:ChangeExp(2000,1)
			player:GetItems():RemoveItem(10014,1)
			player:GetQuests():RemoveQuest(10033)
		end
		return true
	else	
		NpcSay("找到\#B百色花\#W了吗？")
		return false
	end
end

AddQuestTable(Quest10033)

