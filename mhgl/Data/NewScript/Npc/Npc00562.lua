Preload("Quest10031.lua")
Preload("Quest10032.lua")
Preload("Quest10033.lua")
Preload("Quest10034.lua")

Npc000562 = {							
	npc_id = 562,					--南极仙翁
	name = GetNpcName(562),	
	quests = { Quest10031, Quest10032,Quest10033,Quest10034}
}

function Npc000562:Talk(bProcess)	
	local quest_ids = {10031,10032,10033}
	local flag = player:GetQuests():GetFlag(10031)
	local lv = player:GetLevel()
	NpcAsk("我的事情太多，忙不过来，请优先选择一件你最想做的事情吧。（如果你想做的事情不在列表中，请选择“我要做其他事情”）")
	if flag == 0 and lv >= 25 then
	  SetAnswer(1,"寻找白鹿")
	end
	if HasQuest(quest_ids) then
	  SetAnswer(5, "主线任务")
	end
	SetAnswer(2,"学习技能")
	SetAnswer(3,"我要做其他事情")
	SetAnswer(4,"离开")
	WaitAnswer(4)
	if GetAnswer() == 1 then
	  NpcAsk("唉,前两天我与东华帝君下棋,那孽畜竟私自挣脱了讲缰绳,不知跑到哪儿去了,害的我这么一大把年纪还要自己走路回家,腰疼腿疼头疼肚子疼都发作了,苦不堪言啊……我看你腿脚挺灵便的,能不能帮我把那头白鹿儿追回来?")
    SetAnswer(1,"没问题,老仙家,你告诉我白鹿精往哪里跑了?")
    SetAnswer(2,"老人家,你太缺乏锻炼了,没了坐骑,正好给你天天马拉松的机会啊~~~")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      player:GetQuests():SetFlag(10031,1)
	    Quest10031:Take()
	  end
	elseif GetAnswer() == 5 then
		if HasQuest(10032) then
			if Quest10032:Return() then
			  Quest10033:Take()
			end
	  elseif HasQuest(10033) then
			if Quest10033:Return() then
			  Quest10034:Take()
			end
	  end
	end
end










AddNpcTable(Npc000562)
