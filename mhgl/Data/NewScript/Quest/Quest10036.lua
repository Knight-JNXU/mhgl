Preload("Quest10037.lua")
--HULA
Quest10036 = {
	quest_id = 10036,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "打败酒肉和尚",
	descript = "这\#O酒肉和尚\#W一点都不讲道理啊,看来是不打赢他,是见不到玄奘法师了~！",
	require = {
		flag = { {10031, 1 } }
	},
	target_mob = { {mob_id=209, count=1} },
	end_npc = {npc_id=514, map_id=101},
	feature = {"nocancel"},	
}

function Quest10036:Take()
	local pname = player:GetName()
	local flag = player:GetQuests():GetFlag(10031)
	if not player:GetQuests():HasQuest(10036) then	
		NpcSay("自不量力的一群人,今天让你们见识见识我的厉害！")
		if IsProcess() then
			AddQuest(Quest10036)
			player:EncounterBattle(514)
		end
		return true
	else
		return false
	end			
end

function Quest10036:Return()
	local q = player:GetQuests():GetQuest(10036) 
	if QuestCompleted(self) then
			NpcSay("念经念不过他,打架也打不过你,我真没用啊")
			ShowError("\#W获得经验值200")
			if IsProcess() then
				player:ChangeExp(200,1)
				player:GetQuests():RemoveQuest(10036)
			end
			return true
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 514 then
		if IsProcess() then
			player:EncounterBattle(514)
		end	
		return false
	end
end

AddQuestTable(Quest10036)
