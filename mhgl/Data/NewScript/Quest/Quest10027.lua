--HULA

Quest10027 = {
	quest_id = 10027,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "找到云游商人\#R马全有\#W,问问看他哪儿可有地狱灵芝",
	tips = "在同地图场景下，点击“\#P任务日志\#W”里“\#P任务目标\#W”下的“\#P马全有",
	require = { 
	},
	target_npc = { {npc_id=11, map_id=1}},
	end_npc = {npc_id=11, map_id=1},
	feature = {"nocancel"},		
}

function Quest10027:Take()
	if not player:GetQuests():HasQuest(10027) then
		NpcSay("唉,我们老爷身体本来就不太好,但是每次生病，细心调养也就好了,没想到这次....就是那个牛大胆说自己装了鬼之后,老爷的病愈演愈烈,这几天,眼见着就有些神志不清了....大夫说必须要#Y地狱灵芝#W做药引,我们找遍了建邺城、东海湾还是一无所获,你说这可怎么办,听说城里来了个云游商人叫#Y马全有#W,我去找了他好几次,都没见到他的人影,如今老爷的病情越来越重,我也走不开,少侠你能不能再去帮我求求他")
		if IsProcess() then
			AddQuest(Quest10027)
		end
		return true
	else		
		return false
	end
end

function Quest10027:Return()
	if player:GetQuests():HasQuest(10027) and npc:GetNpc_id() == 11 then
		NpcSay("地狱灵芝？我倒是有,只是这东西甚难的,少侠你想要拿他做什么？")
		ISay("李善人生了重病,大夫说,须得地狱灵芝做药引,方可药到病除。")
		NpcSay("李善人可是个大好人,这地狱灵芝给他,也算是物尽其用啦,少侠你赶紧把他拿给管家吧！")
		ShowError("\#W获得经验值800")
		ShowError("\#W获得地狱灵芝")
		if IsProcess() then
			player:ChangeExp(800,1)
			player:GetQuests():RemoveQuest(10027)
			player:GetItems():AddItem(10043, 1)
			player:HandleGuideEvent(19);
		end
		return true
	else
		NpcSay("麻烦少侠替我找\#A马全有\#W，看看他那里是否有地狱灵芝~。")
		return false
	end
end

AddQuestTable(Quest10027)