--ouyang
Preload("Quest23010.lua")
Preload("Quest23011.lua")
Preload("Quest23012.lua")
Preload("Quest23014.lua")

Npc00091 = {							
	npc_id = 91,					--沈天君
	name = GetNpcName(91),	
	quests = {Quest23010,Quest23014}
}


function Npc00091:Talk(bProcess)
	local flag60 = player:GetQuests():GetFlag(60)
	local flag61 = player:GetQuests():GetFlag(61)
	local flag62 = player:GetQuests():GetFlag(62)
	local flag63 = player:GetQuests():GetFlag(63)
	local count2 = player:GetPartnerCollectionCount(2)--绿色同伴，绿林好汉
	local count3 = player:GetPartnerCollectionCount(3)--变异同伴，奇人异士
	local count4 = player:GetPartnerCollectionCount(4)--稀有同伴，世外高人
	local count11 = player:GetPartnerCollectionCount(11)--NPC同伴，江湖隐士	
	local flag420 = player:GetQuests():GetFlag(420)	
	local flag424 = player:GetQuests():GetFlag(424)
	local flag421 = player:GetQuests():GetFlag(421)	
	local flag422 = player:GetQuests():GetFlag(422)	
	local quest23010 = player:GetQuests():GetQuest(23010)
	local quest23014 = player:GetQuests():GetQuest(23014)
	local quest23011 = player:GetQuests():GetQuest(23011)
	local quest23012 = player:GetQuests():GetQuest(23012)	
	NpcAsk( { "天下之大无奇不有，而纵观整个江湖，也实在无所留恋。不如随风流水，云游天下。" } )
	if (player:GetLevel() >= 21 and flag420 == 0) or  quest23010
	or (player:GetLevel() >= 45 and flag424 == 0) or quest23014
	or ( quest23011 and flag421 ==1)
	or ( quest23012 and flag422 ==1) then
		--SetAnswer(1, "新手引导")
	end
	SetAnswer(2, "同伴提修")
	--SetAnswer(3, "同伴提修介绍")
	--SetAnswer(4, "同伴录称号领取")
	--SetAnswer(5, "同伴录介绍")
	SetAnswer(6, "离开")
	WaitAnswer(6)
	if GetAnswer() == 1 then
		if quest23011 and flag421 ==1 then
			Quest23011:Return()
			return
		elseif  quest23012 and flag422 ==1 then
			Quest23012:Return()
			return
		end		
		NpcAsk("我这里新手引导课程较多，请选择你需要的。")		
		if (player:GetLevel() >= 21 and flag420 == 0) or  quest23010 then
			SetAnswer(1, "同伴名录")
		end
		if (player:GetLevel() >= 45 and flag424 == 0) or  quest23014 then
			SetAnswer(2, "同伴提修")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			if player:GetLevel() >= 21 and flag420 == 0 then
				Quest23010:Take()
			else
				Quest23010:Return()
			end
		elseif GetAnswer() == 2 then	
			if player:GetLevel() >= 45 and flag424 == 0 then
				Quest23014:Take()
			else
				Quest23014:Return()
			end
		end
	elseif GetAnswer() == 2 then
		NpcAsk( { "用高级内丹提升" } )
		SetAnswer(3, "高级内丹合成")
		SetAnswer(4, "提高")
		SetAnswer(5, "离开")
		WaitAnswer(5)
		if GetAnswer() == 3 then
script:OpenInterface("refineitem", 0)
		elseif GetAnswer() == 4 then
			script:OpenInterface("subsidy", 0)
		end
	elseif GetAnswer() == 3 then
		NpcSay("玩家可以用白色同伴或者修为丹来提升同伴的修为值，修为值越高的同伴，额外增加的资质就越多。同伴提修成功以后，修为值增加1，同伴修为的最大值为10。当前修为值是0、1、2、3的同伴提修失败后，修为值降到0；当前修为值是4、5、6的同伴提修失败后，修为值降到4；当前修为值是7、8的同伴提修失败后，修为值降到7；当前修为值是9的同伴提修失败后，修为值降到9。")
	elseif GetAnswer() == 4 then
		NpcAsk("收集同伴的类型不同，对应称号的名字和颜色也不相同，你想领取哪种称号？")
		SetAnswer(1, "绿色称号领取")
		SetAnswer(2, "蓝色称号领取")
		SetAnswer(3, "紫色称号领取")
		SetAnswer(4, "金色称号领取")		
		SetAnswer(5, "离开")
		WaitAnswer(5)	
		if GetAnswer() == 1 then
			NpcAsk("当同伴录中收集的绿色同伴达到一定数量时，可以领取绿色称号。收集的数量不同，称号也各有不同。")
			SetAnswer(1, "领取“绿林好汉·人字一号”称号")
			SetAnswer(2, "领取“绿林好汉·地字一号”称号")
			SetAnswer(3, "领取“绿林好汉·天字一号”称号")		
			SetAnswer(4, "离开")
			WaitAnswer(4)
			if GetAnswer() == 1 then 
				if count2 >= 12 and flag60 == 0 then
					NpcAsk("该称号为绿色初级称号，确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了12个绿色同伴，奖励你\#G“绿林好汉·人字一号”\#W称号！")
						if IsProcess() then
							player:AddTitle(655)
							player:GetQuests():SetFlag(60,1)
						end
						return true
					end
				elseif count2 >= 12 and flag60 == 1 then	
					NpcSay("你已经领取了这个称号！")
				elseif count2 >= 12 and flag60 >= 2 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集12个绿色同伴，才能领取这个称号！")
				end					
			elseif GetAnswer() == 2 then
				if count2 >= 24 and flag60 <= 1 then
					NpcAsk("该称号为绿色中级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了24个绿色同伴，奖励你\#G“绿林好汉·地字一号”\#W称号！")
						if IsProcess() then
							if flag60 == 1 then
								player:RemoveTitle(655)
							end	
							player:AddTitle(656)
							player:GetQuests():SetFlag(60,2)
						end
						return true
					end
				elseif count2 >= 24 and flag60 == 2 then	
					NpcSay("你已经领取了这个称号！")
				elseif count2 >= 24 and flag60 >= 3 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集24个绿色同伴，才能领取这个称号！")
				end	
			elseif GetAnswer() == 3 then
				if count2 >= 36 and flag60 <= 2 then
					NpcAsk("该称号为绿色高级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了36个绿色同伴，奖励你\#G“绿林好汉·天字一号”\#W称号！")
						if IsProcess() then
							if flag60 == 1 then
								player:RemoveTitle(655)
							elseif flag60 == 2 then
								player:RemoveTitle(656)
							end
							player:AddTitle(657)
							player:GetQuests():SetFlag(60,3)
						end
						return true
					end
				elseif count2 >= 36 and flag60 == 3 then	
					NpcSay("你已经领取了这个称号！")
				else											
					NpcSay("只有同伴录中成功收集36个绿色同伴，才能领取这个称号！")
				end
			end
		elseif GetAnswer() == 2 then
			NpcAsk("当同伴录中收集的特殊同伴达到一定数量时，可以领取蓝色称号。收集的数量不同，称号也各有不同。")
			SetAnswer(1, "领取“江湖隐士·人字一号”称号")
			SetAnswer(2, "领取“江湖隐士·地字一号”称号")		
			SetAnswer(3, "离开")
			WaitAnswer(3)
			if GetAnswer() == 1 then 
				if count11 >= 5 and flag63 == 0 then
					NpcAsk("该称号为蓝色初级称号，确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了5个特殊同伴，奖励你\#B“江湖隐士·人字一号”\#W称号！")
						if IsProcess() then
							player:AddTitle(658)
							player:GetQuests():SetFlag(63,1)
						end
						return true
					end
				elseif count11 >= 5 and flag63 == 1 then	
					NpcSay("你已经领取了这个称号！")
				elseif count11 >= 5 and flag63 >= 2 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集5个特殊同伴，才能领取这个称号！")
				end					
			elseif GetAnswer() == 2 then
				if count11 >= 10 and flag63 <= 1 then
					NpcAsk("该称号为蓝色中级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了10个特殊同伴，奖励你\#B“江湖隐士·地字一号”\#W称号！")
						if IsProcess() then
							if flag63 == 1 then
								player:RemoveTitle(658)
							end
							player:AddTitle(659)
							player:GetQuests():SetFlag(63,2)
							player:ShowRumor(string.format("梦古世界的十位隐世高人，为了感谢\#W%s\#O对他们一如既往的支持，一致决定赏赐其称号：\#B江湖隐士·地字一号\#O！",player:GetName()),true)
						end
						return true
					end
				elseif count11 >= 10 and flag63 == 2 then	
					NpcSay("你已经领取了这个称号！")				
				else											
					NpcSay("只有同伴录中成功收集10个特殊同伴，才能领取这个称号！")
				end	
			end
		elseif GetAnswer() == 3 then
			NpcAsk("当同伴录中收集的变异同伴达到一定数量时，可以领取紫色称号。收集的数量不同，称号也各有不同。")
			SetAnswer(1, "领取“奇人异士·人字一号”称号")
			SetAnswer(2, "领取“奇人异士·地字一号”称号")
			SetAnswer(3, "领取“奇人异士·天字一号”称号")		
			SetAnswer(4, "离开")
			WaitAnswer(4)
			if GetAnswer() == 1 then 
				if count3 >= 12 and flag61 == 0 then
					NpcAsk("该称号为绿色初级称号，确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了12个变异同伴，奖励你\#P“奇人异士·人字一号”\#W称号！")
						if IsProcess() then
							player:AddTitle(660)
							player:GetQuests():SetFlag(61,1)
							player:ShowRumor(string.format("成功获得\#P奇人异士·人字一号\#O的称号，总在收服12个变异同伴之后，\#W%s\#O开心的笑了！",player:GetName()),true)
						end
						return true
					end
				elseif count3 >= 12 and flag61 == 1 then	
					NpcSay("你已经领取了这个称号！")
				elseif count3 >= 12 and flag61 >= 2 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集12个变异同伴，才能领取这个称号！")
				end					
			elseif GetAnswer() == 2 then
				if count3 >= 24 and flag61 <= 1 then
					NpcAsk("该称号为紫色中级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了24个变异同伴，奖励你\#P“奇人异士·地字一号”\#W称号！")
						if IsProcess() then
							if flag61 == 1 then
								player:RemoveTitle(660)
							end
							player:AddTitle(661)
							player:GetQuests():SetFlag(61,2)
							player:ShowRumor(string.format("\#W%s\#O的身旁成功聚集了24位变异同伴，从此如虎添翼，所向披靡，\#P奇人异士·地字一号\#O的称号也实至名归！",player:GetName()),true)
						end
						return true
					end
				elseif count3 >= 24 and flag61 == 2 then	
					NpcSay("你已经领取了这个称号！")
				elseif count3 >= 24 and flag61 >= 3 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集24个变异同伴，才能领取这个称号！")
				end	
			elseif GetAnswer() == 3 then
				if count3 >= 36 and flag61 <= 2 then
					NpcAsk("该称号为紫色高级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了36个变异同伴，奖励你\#P“奇人异士·天字一号”\#W称号！")
						if IsProcess() then
							if flag61 == 1 then
								player:RemoveTitle(660)
							elseif flag61 == 2 then
								player:RemoveTitle(661)
							end
							player:AddTitle(662)
							player:GetQuests():SetFlag(61,3)
							player:ShowRumor(string.format("踏遍千山万水，走过海角天涯，在成功收服36位变异同伴后，\#W%s\#O终于登上了\#P奇人异士·天字一号\#O的宝座！",player:GetName()),true)
						end
						return true
					end
				elseif count2 >= 36 and flag61 == 3 then	
					NpcSay("你已经领取了这个称号！")
				else											
					NpcSay("只有同伴录中成功收集36个变异同伴，才能领取这个称号！")
				end
			end
		elseif GetAnswer() == 4 then
			NpcAsk("当同伴录中收集的稀有同伴达到一定数量时，可以领取金色称号。收集的数量不同，称号也各有不同。")
			SetAnswer(1, "领取“世外高人·人字一号”称号")
			SetAnswer(2, "领取“世外高人·地字一号”称号")
			SetAnswer(3, "领取“世外高人·天字一号”称号")		
			SetAnswer(4, "离开")
			WaitAnswer(4)
			if GetAnswer() == 1 then 
				if count4 >= 9 and flag62 == 0 then
					NpcAsk("该称号为金色初级称号，确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了9个稀有同伴，奖励你\#Y“世外高人·人字一号”\#W称号！")
						if IsProcess() then
							player:AddTitle(663)
							player:GetQuests():SetFlag(62,1)
							player:ShowRumor(string.format("牺牲九位稀有，才见金榜题名！\#W%s\#O哭着告诉大家：\#Y世外高人·人字一号\#O就是这样炼成的！",player:GetName()),true)
						end
						return true
					end
				elseif count4 >= 9 and flag62 == 1 then	
					NpcSay("你已经领取了这个称号！")
				elseif count4 >= 9 and flag62 >= 2 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集9个稀有同伴，才能领取这个称号！")
				end					
			elseif GetAnswer() == 2 then
				if count4 >= 18 and flag62 <= 1 then
					NpcAsk("该称号为金色中级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了18个稀有同伴，奖励你\#Y“世外高人·地字一号”\#W称号！")
						if IsProcess() then
							if flag62 == 1 then
								player:RemoveTitle(663)
							end
							player:AddTitle(664)
							player:GetQuests():SetFlag(62,2)
							player:ShowRumor(string.format("又见金榜题名时，几人在哭，几人在笑！18位稀有同伴绝迹江湖的同时，位居\#Y世外高人·地字一号\#O的\#W%s\#O也已难觅踪迹！",player:GetName()),true)
						end
						return true
					end
				elseif count4 >= 18 and flag62 == 2 then	
					NpcSay("你已经领取了这个称号！")
				elseif count4 >= 18 and flag62 >= 3 then	
					NpcSay("人往高处走，你已经获得了更高级的称号！")
				else											
					NpcSay("只有同伴录中成功收集18个稀有同伴，才能领取这个称号！")
				end	
			elseif GetAnswer() == 3 then
				if count4 >= 27 and flag62 <= 2 then
					NpcAsk("该称号为金色高级称号，同一种类型的称号，只能保留一个较高级的称号，低级称号将被移除，你确认领取吗？")
					SetAnswer(1, "领取")		
					SetAnswer(2, "离开")
					WaitAnswer(2)
					if GetAnswer() == 1 then
						NpcSay("少侠的同伴录成功收集了27个稀有同伴，奖励你\#Y“世外高人·天字一号”\#W称号！")
						if IsProcess() then
							if flag62 == 1 then
								player:RemoveTitle(663)
							elseif flag62 == 2 then
								player:RemoveTitle(664)
							end
							player:AddTitle(665)
							player:GetQuests():SetFlag(62,3)
							player:ShowRumor(string.format("寻找稀有同伴的路不好走，有人却走了很久……在成功收服27个稀有同伴后，\#W%s\#O站在荣誉的顶峰感慨道：想做\#Y世外高人·天字一号\#O，真不容易！",player:GetName()),true)
						end
						return true
					end
				elseif count4 >= 27 and flag62 == 3 then	
					NpcSay("你已经领取了这个称号！")
				else											
					NpcSay("只有同伴录中成功收集27个稀有同伴，才能领取这个称号！")
				end
			end
		end
	elseif GetAnswer() == 5 then
		NpcSay("点开同伴录可以看到，每收录一个同伴，会有相应的属性加成，同伴录窗口下方显示为同伴属性加成的总和。只有在激发潜能状态下，同伴的属性加成才会生效，同时战斗过程中会伴有特殊光效，但在激发潜能状态下，同伴消耗的健康值会为平时的\#G8\#W倍。")
		NpcSay("当同伴录中收录的同伴达到一定数量时，窗口下方熄灭的灯会被依次点亮，激发状态下的光效也会随之发生改变。另外，当收录同伴达到一定数量时，你还可以到我这里来领取令人羡慕的称号。")
	end
	return false
end

AddNpcTable(Npc00091)
