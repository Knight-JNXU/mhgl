--HULA
Quest63530 = {
	quest_id = 63530,				-- quest ID
	type_id = 63530,					-- type ID
	type_name = "幻境任务",
	name = "瓶颈突破",
	descript = "打败了\#O魔神·蚩尤\#W，然后在找\#A吴刚\#W进行下一步操作吧。",
	tips = "\#P魔神·蚩尤\#W”难度非常大,此任务推荐与\#A队员\#W组队进行击杀。",
	require = {
		flag = { {63530, 1 } }
	},
	target_mob = { {mob_id=1188, count=1} },
	end_npc = {npc_id=200009, map_id=53800},
	feature = {"nocancel"},	
}

function Quest63530:Take()
	local pname = player:GetName()
	local flag = player:GetQuests():GetFlag(63530)
	if not player:GetQuests():HasQuest(63530) then	
		NpcAsk("魔神·蚩尤已经在里面等候你们多时,少侠击败魔神以后再前来找我吧。")
		SetAnswer(1,"开始挑战")
		SetAnswer(2,"离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
		  if player:GetMoney() < 100 then
		    NpcSay("传送各位少侠前去幻境是很累很累的,若是没有8.....额,后面有很多个0,让我数一数,1,2,3.....嗯,对,是800万,我可不愿意传送少侠前去幻境~")
		    return
		  end
	  	if IsProcess() then
		  	AddQuest(Quest63530)
			  player:EncounterBattle(402008)
			  player:ChangeMoney(-100)
			end
		end
		return true
	else
		return false
	end			
end

function Quest63530:Return()
	local q = player:GetQuests():GetQuest(63530) 
	local flag = player:GetQuests():GetFlag(63530)
	if QuestCompleted(self) then
			NpcSay("可喜可贺,少侠成功突破幻境,这是幻境丹,可助少侠修行,另外这是小的一点心意,请少侠笑纳。")
			if IsProcess() then
            player:GetItems():AddItem(555558, 1)
			player:GetQuests():SetFlag(63530,1)
			player:GetQuests():RemoveQuest(63530)
			player:GetItems():RemoveItem(555556, 1)
			end
			return true
	elseif q and  q:GetTargetMobNum(1188) == 0 and npc:GetNpc_id() == 200009 then
		if IsProcess() then
			player:EncounterBattle(402008)
		end	
		return false
	end
end

AddQuestTable(Quest63530)
