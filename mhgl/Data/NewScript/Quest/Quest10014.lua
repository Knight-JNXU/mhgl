--HULA

Quest10014 = {
	quest_id = 10014,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "马上就要离开建邺城去外面闯荡江湖了，记得把精神养好。去\#P东升客栈\#W找老板\#W要一间上好的客房休息休息吧。",
	tips = "在\#P建邺城\#W上点击\#PTab\#W键打开中地图可找到\#P东升客栈\#W的具体方位。",
	require = { 
	},
	target_npc = { {npc_id=441, map_id=55}},
	end_npc = {npc_id=441, map_id=55},
	feature = {"nocancel"},		
}

function Quest10014:Take()
	if not player:GetQuests():HasQuest(10014) then
		NpcSay("你的气色似乎不太好，莫非刚刚与人动了手？快到\#P东升客栈\#W找\#A老板\#W要间上房好好休息下吧。")
		if IsProcess() then
			AddQuest(Quest10014)
		end
		return true
	else		
		return false
	end
end

function Quest10014:Return()
	if player:GetQuests():HasQuest(10014) and npc:GetNpc_id() == 441 then
		NpcSay("你的经历也足够多了，满足10级后可通过建业守卫传送出江南野外")
		ShowError("\#W获得经验值800")
		if IsProcess() then
			player:ChangeExp(800,1)
		--	player:ChangeMoney(80,1)	
			player:GetQuests():RemoveQuest(10014)
			player:HandleGuideEvent(20);
		end
		return true
	else
		NpcSay("看你精神不佳，是不是刚跟人打了架？快到\#P东升客栈\#W找\#A老板\#W要间上好的房间休息下吧。")
		return false
	end
end

AddQuestTable(Quest10014)