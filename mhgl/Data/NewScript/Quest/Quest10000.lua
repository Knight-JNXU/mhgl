--HULA
Quest10000 = {
	quest_id = 10000,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "初出江湖",
	descript = "在外面溜达了半天，还是赶紧回\#A宠物仙子\#W那复命吧。",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A宠物仙子\#W”就可以自动寻路至\#A宠物仙子\#W跟前了。",
	require = {
		flag = { {10000, 0} },
	},
	target_npc = { {npc_id=1, map_id=1} },
	end_npc = {npc_id=1, map_id=1},
	feature = {"nocancel"},	
}

function Quest10000:Take()
	local flag = player:GetQuests():GetFlag(10000)
	if not player:GetQuests():HasQuest(10000) and flag == 0 then
		local pname = player:GetName()
		local sname = "宠物仙子"
		ISay("天色不早，也该回去禀明\#A宠物仙子\#W，求她准我出城，去瞧瞧外面的世界！")
		if IsProcess() then
			AddQuest(Quest10000)			
			player:HandleGuideEvent(4);
		end
		return true
	else
		return false
	end
end

function Quest10000:Return()
	local pname = player:GetName()
	local sname = "宠物仙子"
	if QuestCompleted(self) then
		NpcSay(string.format("%s，你又溜出去看那些京城来的戏班唱戏了？又听到不少好玩的事了吧？奖励你经验值200。", player:GetName())) 
		ShowError("\#W获得经验值200")
		if IsProcess() then
			player:ChangeExp(200,1)
	--		player:ChangeSMoney(50000)
--ShowError("\#W储备金50000两")
			--player:ChangeMoney(20,1)
			player:GetQuests():SetFlag(10000, 1)
			player:GetQuests():RemoveQuest(10000)
			--player:HandleGuideEvent(6);
		end
		return true	
	else
		ISay("呀，都出来这么久了，得赶紧回去告诉\#A宠物仙子\#W。还好我会自动寻路，嘿嘿。按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A宠物仙子\#W”就可以自动寻路至\#A宠物仙子\#W跟前了。")
		return false
	end
end

AddQuestTable(Quest10000)
