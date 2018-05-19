Preload("Quest50000.lua")
Preload("Quest42007.lua")
Preload("Quest42008.lua")
Preload("Quest22109.lua")
Preload("Quest22110.lua")
Npc00018= {	
	npc_id = 18,				
	name = GetNpcName(18),		
	quests = { Quest42007,Quest42008,Quest22109,Quest22110}						
}

function Npc00018:Talk(bProcess)
    local Quest50000 = player:GetQuests():GetQuest(50000) 
	local lv = player:GetLevel()
		NpcAsk( {"门派闯关活动从我这里领取任务。"})	
		--SetAnswer(1, "重置属性点")
		if player:GetQuests():HasQuest(50000) and Quest50000:GetTargetNpcId(1) == 18 then
			SetAnswer(2, "领取“门派闯关”奖励")
		end
		if player:GetQuests():HasQuest(50000) and Quest50000:GetTargetNpcId(1) ~= 18 then
			SetAnswer(3, "删除“门派闯关”任务")
		end
		if HasQuest(42007) or HasQuest(42008) then
			SetAnswer(4, "月下传情")
		end
		if HasQuest(22109) or HasQuest(22110) then
			SetAnswer(5,"阵法的迷惑")
		end
		SetAnswer(6, "离开")
		WaitAnswer(6)
		if GetAnswer() == 1 then
		    NpcAsk("等级大于40级可以在我这里免费重置属性点，不过机会只有一次，你现在要洗点吗？")
			SetAnswer(1, "我决定了")
			SetAnswer(2, "我再考虑考虑")
			WaitAnswer(2)
			if GetAnswer() == 1 then
				local flag = player:GetQuests():GetFlag(18)	
				if flag == 1 then
					NpcSay("洗点的机会只有一次。")
					return
				end
				if lv >= 40 then
				    player:ResetCharLevel(lv)
					player:GetQuests():SetFlag(18,1)
					NpcSay("洗点成功。请合理分配自己的属性点。")
				else
					NpcSay("请40级以后再来吧。")
				end				
			end
		elseif GetAnswer() == 2 then
			    if player:GetItems():GetFreeSlot(0) < 1 then
				    NpcSay("请先整理下包裹。")
				else
					if player:GetQuests():HasQuest(50000) and Quest50000:IsFailed() == true then
						local Exp = (4*lv+10)*6.6*420*(3.5+Quest50000:GetTargetMobId(1)-1999)/90
						local Money = 1000
						if IsProcess() then	
							player:ChangeExp(Exp,500)
							player:ChangeMoney(Money,500)
						end
						NpcSay("辛苦了，这是你的奖励，请收下。")
						ShowMessage(string.format("\#W获得经验值%d，银两%d",Exp,Money))
						if bProcess then
						player:GetQuests():RemoveQuest(50000)
						end
						return
					else	
						local honor = 10*lv
					    if bProcess then
							player:ChangeHonor(honor)			
							player:GetItems():AddItem(30009, 1)							
							player:GetQuests():RemoveQuest(50000) 
						end	
						NpcSay("辛苦了，这是你的奖励，请收下。")
						ShowMessage(string.format("\#W获得威望%d",honor))
						--ShowMessage("\#W获得蓝铁精英")
						return
					end
					if player:GetQuests():TimeMarkOver(50000, 180) == true then
						player:GetQuests():RemoveTimeMark(50000)
					end
				end
		elseif GetAnswer() == 3 then
			NpcAsk("删除任务后只能下次再参加了，你确定吗？")
			SetAnswer(1, "删除任务")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then 
				NpcSay("任务已经删除了。")
				if bProcess then
					player:GetQuests():RemoveQuest(50000) 
				end
			end
		elseif GetAnswer() == 4 then
			if Quest42007:Return() then
				--[[Quest42008:Take()	
			elseif HasQuest(42008) and player:GetQuests():GetQuest(42008):GetTargetMobNum(1) == 0 then
				NpcSay("阁下近来在江湖中的名声也是十分鼎盛，在下特请赐教几招！ ")
				player:EncounterBattle(18)
			elseif HasQuest(42008) and player:GetQuests():GetQuest(42008):GetTargetMobNum(1) == 1 then
				Quest42008:Return()
			else
				NpcSay("我的水煮荷包蛋呢？")]]
				if bProcess then
					player:EncounterBattle(18)	
				end
			end
		elseif GetAnswer() == 5 then
			if HasQuest(22109) then
				if Quest22109:Return()	then	
					Quest22110:Take()
				end
			elseif HasQuest(22110) then
				Quest22110:Return()
			end
		end
end
AddNpcTable(Npc00018)