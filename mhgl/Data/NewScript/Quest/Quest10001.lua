--HULA
Quest10001 = {
	quest_id = 10001,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "打败了\#O小野猪\#W，看看\#A宠物仙子\#W还有什么要交待的。",
	tips = "体会完如何“\#P普通攻击\#W”后继续与\#A宠物仙子\#W对话进行下一步任务吧。点击\#PF12\#W键即可屏蔽本地图上除NPC以外的所有人。",
	require = {
		flag = { {10000, 1 } }
	},
	target_mob = { {mob_id=176, count=1} },
	end_npc = {npc_id=1, map_id=1},
	feature = {"nocancel"},	
}

function Quest10001:Take()
	local pname = player:GetName()
	local flag = player:GetQuests():GetFlag(10000)
	if not player:GetQuests():HasQuest(10001) then	
		NpcSay("怎么？你也来求我让你出城？你已非三岁毛孩，我自然拦你不住。只是你有多少真本事闯荡江湖？且来试试你的身手。你若想要出城，把这只\#O小野猪\#W打倒方可商量！")
		if IsProcess() then
			AddQuest(Quest10001)
			player:EncounterBattle(1)
		end
		return true
	else
		return false
	end			
end

function Quest10001:Return()
	local q = player:GetQuests():GetQuest(10001) 
	if QuestCompleted(self) then
			NpcSay("好孩子，能有这番修为，奖励你经验值200。")
			ShowError("\#W获得经验值200")
			if IsProcess() then
				player:ChangeExp(200,1)
				player:GetQuests():RemoveQuest(10001)
				player:HandleGuideEvent(7);
			end
			return true
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 1 then
		if IsProcess() then
			player:EncounterBattle(1)
		end	
		return false
	end
end

AddQuestTable(Quest10001)
