Preload("Quest50007.lua")
Npc300060 = {							    --1号文考官
	npc_id = 300060,						-- NPC ID
	name = GetNpcName(300060),				-- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300060:Talk(bProcess)
	local Quest = player:GetQuests():GetQuest(50007)  
	local flag = player:GetQuests():GetFlag(50007)
	local Flag = player:GetQuests():GetFlag(507)
	if player:GetQuests():HasQuest(50006) and player:GetQuests():GetQuest(50006):GetTargetNpcId(1) == 300080 then
		NpcSay("少侠应该去京城（32，200）找\#A武考官\#W开始会试。")
		return
	end
	NpcAsk("我是科举的文试考官，少侠可是来参加文试的？")
	if player:GetQuests():TimeMarkOver(50007, 300) ~= false then --活动结束或者未参加过活动
	    SetAnswer(1, "是的")
	end
	if player:GetQuests():TimeMarkOver(50007, 300) == false then --活动期间内
		if Quest ~=nil and Quest:GetTargetNpcId(1) ~= self.npc_id then	--有任务时	
			SetAnswer(2, "退出科举")
		end
		if Quest == nil or (Quest ~=nil and player:GetQuests():GetQuest(50007):IsFailed())then       --任务为空，即完成某次任务后
			SetAnswer(3, "重新科举")
		end
	end
	SetAnswer(4, "再等等")
	WaitAnswer(4)
			
		if GetAnswer() == 1 then
			if player:GetLevel() < 30 then
			    NpcSay("低于30级不能参加科举。")
				return
			end
			if player:GetQuests():TimeMarkOver(50008, 300) == false or player:GetQuests():HasQuest(50008) then
				NpcSay("每次科举只能参加一个类型的考试。")
				return
			end
		    local Quest = player:GetQuests():GetQuest(50007)
		    if Quest == nil	then
				local flag300090 = player:GetQuests():GetFlag(50006)
				if flag300090 == 1 and player:GetQuests():TimeMarkOver(50006, 300) == false then --活动期间内完成过乡试
				    if player:GetQuests():TimeMarkOver(50007, 300) == true then
					   player:GetQuests():RemoveTimeMark(50007)
					end
					Quest50007:Take()	
					if bProcess then
						player:GetQuests():RemoveQuest(50006)
						player:GetQuests():SetFlag(50007,1)
					end
				else
					NpcSay("通过乡试以后才能参加科举。")
				end
	        elseif Quest:GetTargetNpcId(1) ~= self.npc_id then
				NpcAsk("需要删除上次的任务吗？")
				SetAnswer(1, "删除任务")
				SetAnswer(2, "离开")
				WaitAnswer(2)
					
				if GetAnswer() == 1 then
					NpcSay("任务已删除。")
					player:GetQuests():RemoveQuest(50007)
					player:GetQuests():SetFlag(50007,0)
					player:GetQuests():RemoveFlag(507)
				end
			end
		elseif 	GetAnswer() == 2 then	
			if Flag >= 10 then
				NpcSay("少侠不要灰心，下次科举再来吧。")
				player:GetQuests():RemoveQuest(50007)
				player:GetQuests():RemoveFlag(507)
				player:GetQuests():SetFlag(50007,4)
			else
				NpcAsk("退出本届科举大赛，只有下次才能继续参加，你考虑好了吗？")
				SetAnswer(1, "我考虑好了")
				SetAnswer(2, "我点错了")
				WaitAnswer(2)
				if GetAnswer() == 1 then
				    NpcSay("你退出了本次科举。")
				    player:GetQuests():RemoveQuest(50007)
					player:GetQuests():SetFlag(50007,4)
					player:GetQuests():RemoveFlag(507)
				end
			end
		elseif 	GetAnswer() == 3 then		
			if Flag >= 10 then
				flag = player:GetQuests():GetFlag(50007)
				NpcSay("少侠不要灰心，再来一次吧。")
				player:GetQuests():RemoveQuest(50007)
				player:GetQuests():RemoveFlag(507)
				player:GetQuests():SetFlag(50007,flag+1)
			else
				NpcAsk("少侠若是对自己的成绩不满意可以报名重新科举。")
				SetAnswer(1, "我重新参加科举")
				SetAnswer(2, "离开")
				WaitAnswer(2)
				if GetAnswer() == 1 then 
					if flag == 3 then
						NpcSay("你已参加了三次会试，请下次活动再来吧。")
						return
					elseif flag == 4 then
						NpcSay("你已退出了本次科举，请下次活动再来吧。")
						return			
					end
					if bProcess then
						player:GetQuests():RemoveTimeMark(50007)
						player:GetQuests():RemoveFlag(507)
						flag = player:GetQuests():GetFlag(50007)
						player:GetQuests():SetFlag(50007,flag+1)
					end
					Quest50007:Take()
				end
			end
		end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300060)
