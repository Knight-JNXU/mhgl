--HULA

Quest10029 = {
	quest_id = 10029,				-- quest ID
	type_id = 1,					-- type ID
	name = "初出江湖",
	type_name = "主线任务",
	descript = "向\#R李善人\#W,打听一下建邺城闹鬼的事情",
	tips = "按下“\#PTab\#W”键“\#P打开小地图\#W进入建业民居",
	require = { 
	},
	target_npc = { {npc_id=448, map_id=63}},
	end_npc = {npc_id=448, map_id=63},
	feature = {"nocancel"},		
}

function Quest10029:Take()
	if not player:GetQuests():HasQuest(10029) then
	  NpcSay("多谢少侠了,少侠可是救命恩人,快快快,我这就带少侠前去见我家主人")
		if IsProcess() then
			AddQuest(Quest10029)
		end
		return true
	else		
		return false
	end
end

function Quest10029:Return()
	if player:GetQuests():HasQuest(10029) and npc:GetNpc_id() == 448 then
		NpcSay("多谢少侠救民之恩,说起这建邺城闹鬼,跟我可是有一定关系的啊")
		ISay("老先生何出此言?")
		NpcSay("七年前,我与一个北俱芦洲的朋友一道前往西牛贺洲收获,回程时我们讲定,先会建邺城卸下我的货物,他也顺便在我这儿小住几日,可是没想到,船开导东海湾,竟遇上了异常大风暴,货船也出了事")
		ISay("这......")
		NpcSay("当时,我们二人都掉进了海里,幸运的是,我抱住了一个大木桶,尚能浮在海面.风雨里,我听着他呼救着我喊我的名字,可是我想,这木桶怕是承受不了我们两人的重量....于是我眼睁睁的看着他....沉入海里.....")
		ISay("然后,东海湾就出现了闹鬼的传闻？")
		NpcSay("是啊,我回到建邺城不足一月,便又人说在东海湾撞见了鬼....最近,我更是夜夜梦见他对我怒目而视,紧接着,就传出了建邺城闹鬼的事儿,我知道,打错已经铸成,我虽然每年都托人带财物给他的家人,还请道士做法事超度他,但依旧无法减轻我的罪孽,可是,要报仇找老夫便是了,何苦伤害无辜的百姓呢？少侠,我想请你替我去问个明白。")
		ISay("那,我该去何处寻找他呢？")
		NpcSay("那艘船是在东海湾沉没的,大家现在都叫他东海沉船,去哪儿说不定能够找到一些线索")
		ISay("事不宜迟,我这就出发！")
		if IsProcess() then
			player:ChangeExp(800,1)
			player:GetQuests():RemoveQuest(10029)
			player:GetItems():AddItem(10043, 1)
			player:HandleGuideEvent(19);
		end
		return true
	else
		NpcSay("少侠前去沉船调查的怎么样了?发现了什么了吗？~。")
		return false
	end
end

AddQuestTable(Quest10029)