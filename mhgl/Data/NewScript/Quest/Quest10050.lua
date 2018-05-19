Preload("Quest10037.lua")
--HULA
Quest10050 = {
	quest_id = 10050,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "玄奘的身世",
	descript = "这\#O酒肉和尚\#W尽然对玄奘法师下毒,看来不教训他一顿,他是不肯给出解药了~！",
	require = {
		flag = { {10031, 1 } }
	},
	target_mob = { {mob_id=209, count=1} },
	end_npc = {npc_id=514, map_id=101},
	feature = {"nocancel"},	
}

function Quest10050:Take()
	local pname = player:GetName()
	if not player:GetQuests():HasQuest(10050) then	
		NpcSay("想要解药?没门~！！！！")
		if IsProcess() then
			AddQuest(Quest10050)
			player:EncounterBattle(514)
		end
		return true
	else
		return false
	end			
end

function Quest10050:Return()
	local q = player:GetQuests():GetQuest(10050) 
	if QuestCompleted(self) then
			NpcSay("别打了,别打了,解药是九转还魂丹,普陀山的龙女宝宝有此药,别打我了,我都告诉你~！")
			ShowError("\#W获得经验值200")
			if IsProcess() then
				player:ChangeExp(200,1)
				player:GetQuests():RemoveQuest(10050)
			end
			return true
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 514 then
		if IsProcess() then
			player:EncounterBattle(514)
		end	
		return false
	end
end

AddQuestTable(Quest10050)
