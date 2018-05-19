--HULA
Quest10003 = {
	quest_id = 10003,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "终于学到武功了，就拿桥边那头\#A野猪王\#W做下试验，试下这招式的威力吧。",
	tips = "打败\#O野猪王\#W后再回去看看\#A宠物仙子\#W还有什么要交待的。",
	require = { },
	target_npc = { {npc_id=583, map_id=1} },--野猪王NpcID  野猪王地图ID
	target_mob = { {mob_id=175, count=1} },--暂借新手试练野猪王
	end_npc = {npc_id=1, map_id=1},    --完成任务后交任务Npc的ID     地图ID
	feature = {"nocancel"},	
}

function Quest10003:Take()
	if not player:GetQuests():HasQuest(10003) then
		local skill_id 
		local skillName
		
		--[[技能暂时借用古龙，后期更改牛刀小试 --]]
		if player:GetJob() == 1 then
			skill_id = 420
			skillName = "行侠仗义"
		elseif player:GetJob() == 2 then
			skill_id = 420
			skillName = "八面玲珑"
		elseif player:GetJob() == 3 then
			skill_id = 420
			skillName = "妙手仁心"
		elseif player:GetJob() == 4 then
			skill_id = 420
			skillName = "疾风掠影"	
		end	
		
		
		
		
		NpcSay(string.format("%s，眼看你就要到外面去闯荡江湖，宠物仙子也没啥要教你的，这一招\#P%s\#W虽然这不是什么绝世武学，但也足以作防身之用。", player:GetName(),skillName))
		NpcSay("哼，且别高兴得太早！我需再试炼你们一次，方可放你们出去！桥头的\#O野猪王\#W，你们去会一会它。切记要齐心合力，莫要轻敌疏忽！")
		--NpcSay(string.format("此外使用快捷键\#PAlt+W\#W可打开技能栏，点击并拖动技能图标到快捷栏中，即可使用快捷键\#PF1~F10\#W使用技能。方才教你的\#P%s\#W在技能界面的生活技能栏里，你尝试着把\#P%s\#W拖到快捷栏里吧。", skillName, skillName))
		if IsProcess() then
			if not player:HasSkill(skill_id) then
				player:AddSkill(skill_id)
			end
			AddQuest(Quest10003)
			player:HandleGuideEvent(10);
		end
		return true
	else
		return false
	end			
end

function Quest10003:Return()
	local q = player:GetQuests():GetQuest(10003) 
	if QuestCompleted(self) then
		NpcSay("看来这里已留不住你了！奖励你经验400。")
		ShowError("\#W获得经验值400")	
		if IsProcess() then
			player:ChangeExp(400,1)
		--	player:ChangeMoney(40,1)	
			player:GetQuests():RemoveQuest(10003)
		end
		return true
	
	elseif q and npc:GetNpc_id() == 20 then   --陈长寿
		NpcSay("对付桥盘边的那头野猪后就去无名岛找\#P治疗师\#W陈长寿吧。")
		return false
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 583 then
		if IsProcess() then
			FindTargetNpc(10003, 1)
			player:EncounterBattle(583)
		end	
		return false
	elseif q and  q:GetTargetMobNum(1) == 1 and npc:GetNpc_id() == 583 then
		NpcSay("……")
		return false	
	else
		
		
		
		NpcSay("你们两个还在磨蹭着什么？还不快去打败桥头的\#O野猪王\#W让我看看。")
		return false
	end
end

AddQuestTable(Quest10003)
