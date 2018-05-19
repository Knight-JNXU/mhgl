--HULA
Quest10032 = {
	quest_id = 10032,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "打倒白鹿精",
	descript = "看来不给\#O白鹿精\#W，一点教训,他是不肯回去了,#P战斗胜利以后,带着白鹿精回去找南极仙翁复命吧~",
	require = {
		flag = { {10031, 1 } }
	},
	target_mob = { {mob_id=208, count=1} },
	end_npc = {npc_id=562, map_id=108},
	feature = {"nocancel"},	
}

function Quest10032:Take()
	local pname = player:GetName()
	local flag = player:GetQuests():GetFlag(10031)
	if not player:GetQuests():HasQuest(10032) then	
		NpcSay("如若你本事比我大,我自然愿意让你带我回去,如若不然,哼哼~~~！")
		if IsProcess() then
			AddQuest(Quest10032)
			player:EncounterBattle(136)
		end
		return true
	else
		return false
	end			
end

function Quest10032:Return()
	local q = player:GetQuests():GetQuest(10032) 
	if QuestCompleted(self) then
			NpcSay("太好了,这下可不用每天走路了,快快快,让我看看我的白鹿~~~！！")
			ShowError("\#W获得经验值200")
			if IsProcess() then
				player:ChangeExp(200,1)
				player:GetQuests():RemoveQuest(10032)
			end
			return true
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 136 then
		if IsProcess() then
			player:EncounterBattle(136)
		end	
		return false
	end
end

AddQuestTable(Quest10032)
