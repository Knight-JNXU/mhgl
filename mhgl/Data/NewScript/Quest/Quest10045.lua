--HULA
Quest10045 = {
	quest_id = 10045,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "挑战天兵",
	descript = "这守门天兵整天也是够无聊的,为了打听到女妖的消息,看来不得不跟守门天兵打一场了~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A守门天兵\#W”就可以自动寻路至\#A守门天兵\#W跟前了。",
	require = {
		flag = { {10031, 1 } }
	},
	target_mob = { {mob_id=208, count=1} },
	end_npc = {npc_id=116, map_id=13},
	feature = {"nocancel"},	
}

function Quest10045:Take()--任务领取
	local pname = player:GetName()
	local flag = player:GetQuests():GetFlag(10031)
	if not player:GetQuests():HasQuest(10045) then	
		 if IsProcess() then
			 AddQuest(Quest10045)
			 player:EncounterBattle(136)
	 	 end
	 return true
	else
	 return false
  end
end

function Quest10045:Return()--完成任务
	local q = player:GetQuests():GetQuest(10045) 
	if QuestCompleted(self) then
			NpcSay("这女妖原本是天上的琉璃盏,被卷帘大将打碎之后,掉落凡间,这女妖就是其中一块碎片~!")
			ISay("原来如此,得赶快帮主空慈方丈找回佛光舍利子才好~！")
			ShowError("\#W获得经验值200")
			if IsProcess() then
				player:ChangeExp(200,1)
				player:GetQuests():RemoveQuest(10045)
				Quest10046:Take()
			end
			return true
	elseif q and  q:GetTargetMobNum(1) == 0 and npc:GetNpc_id() == 116 then
		if IsProcess() then
			player:EncounterBattle(136)
		end	
		return false
	end
end

AddQuestTable(Quest10045)
