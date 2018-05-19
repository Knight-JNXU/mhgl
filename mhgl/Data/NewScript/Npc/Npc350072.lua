--beifang
--万梅山庄西门吹雪

Npc350072 = {							
	npc_id = 350072,					
	name = GetNpcName(350072),	
}

function Npc350072:Talk(bProcess)		
	if player:GetQuests():GetFlag(60220) == 350070 then
        local FreesLot = player:GetItems():GetFreeSlot(0)
		local lv = player:GetLevel()
		if FreesLot >= 1 then						
			NpcSay(string.format("不愧为江湖上的后起之秀，一杯茶的时间你就破了此阵，奖励你经验%d。",800000+(lv-40)*1000))				
			ShowError(string.format("\#W得到经验%d",800000+(lv-40)*1000))
			--ShowError("\#W得到副本积分+10")
			if IsProcess() then	
				player:GetQuests():RemoveQuest(60220)
				player:ChangeExp(800000+(lv-40)*1000,6022)
    --player:GetQuests():SetFlag(60230, flag + 10)
				player:GetQuests():SetFlag(60220,0)
			end
		else
		    ShowHint("请先清理一下你的当前背包，至少预留一个位置。")
			return true
		end
		--山庄套装
		local num = 1
		if lv - 40 <= 80 then
			num = 100
		elseif lv - 40 <= 120 then
			num = 50
		elseif lv - 40 <= 150 then
			num = 30
		elseif lv - 40 <= 175 then
			num = 10
		end
		if math.random(0,99) < num and player:GetItems():GetFreeSlot(0) > 0 then	
			if IsProcess() then	
				script:SetSaying(true)
				local item = RandTable({15006,15007,15008,15009,80170,80171,80172,60416,60426,60436,60446,60456,60466,60476,60406,402800,402801,402830,401669,401670})
				player:GetItems():AddItem(item,1)
				player:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item)))
			end
		end	
	else
	    NpcSay("墙角数枝梅，凌寒独自开。遥知不是雪，为有暗香来。")
		ISay("好诗好诗！")
		NpcSay("哪里哪里……")
		ISay("……")
		NpcSay("好久没和人过招，也不知道我那“一剑西来”是否潇洒依然，要不我们过两招？")
		ISay("……")	 		
		NpcAsk( "......" )	
		--SetAnswer(1, "过招")		
		SetAnswer(2, "查询积分")
		--SetAnswer(3, "兑换礼包")
		SetAnswer(4, "传送至长安")
		SetAnswer(5, "离开")
		WaitAnswer(5)	
		if GetAnswer() == 1 then
			if IsProcess() then	
				player:EncounterBattle(713)
			end	
        elseif GetAnswer() == 2 then
			local flag60230 = player:GetQuests():GetFlag(60230)
			NpcSay(string.format("\#W你的积分为\#P%d\#W点。",flag60230))			
		elseif GetAnswer() == 3 then
		    NpcAsk( "你要用20点梅花桩积分换取一个万梅山庄礼包吗？" )	
			SetAnswer(1, "是的")
			SetAnswer(2, "我再想想")
			WaitAnswer(2)	
			if GetAnswer() == 1 then			
		        local flag60225 = player:GetQuests():GetFlag(60225)				
				if flag60225 >= 20 then
				    local FreesLot = player:GetItems():GetFreeSlot(0)
					if FreesLot >= 1 then                     				
						if IsProcess() then	
						    player:GetQuests():SetFlag(60225,flag60225-20)
							player:GetItems():AddItem(71010, 1)
					    end
						 NpcSay("成功兑换一个万梅山庄礼包。")
					else
					    ShowHint("请先清理一下你的当前背包，至少预留一个位置。") 
                    end					
				else
				    NpcSay("你的梅花桩积分不足20点，无法兑换。")
				end
			end
		elseif GetAnswer() == 4 then
		    if IsProcess() then	
				player:JumpMap(34, 253, 176)
			end					
		end			
	end	
end

AddNpcTable(Npc350072)
