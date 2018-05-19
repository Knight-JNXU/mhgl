--HULA

Quest10030 = {
	quest_id = 10030,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "前往东海湾沉船内室击败\#R商人的鬼魂\#W后在找到李善人",
	tips = "\#O沉船内室\#W就在\#P东海湾\#W传送进入。",
	require = {},
	target_mob = { {mob_id=177, count=1} },
	end_npc = {npc_id=448, map_id=63},
	feature = {"nocancel"},		
}

function Quest10030:Take()
	if not player:GetQuests():HasQuest(10030) then	
		if IsProcess() then
			AddQuest(Quest10030)
		end
		return true
	else
		return false
	end			
end

function Quest10030:Return()
	if QuestCompleted(self) then
		NpcSay("原来他一直没有憎恨我当年没有救他,也多谢少侠了解我的心事,这些奖励少侠请笑纳。")
		ISay("行侠仗义也是我的本分嘛,客气了")
		ShowError("\#W获得经验值1000")
		if IsProcess() then
			player:ChangeExp(1000,1)
			player:GetQuests():RemoveQuest(10030)
		end
		return true
	elseif npc:GetNpc_id() == 448 then
		NpcSay("击败了商人的鬼魂后在来找我")
		return false
	else
		NpcSay("替李善人到东海沉船内室找到商人的鬼魂")
		return false
	end
end

AddQuestTable(Quest10030)