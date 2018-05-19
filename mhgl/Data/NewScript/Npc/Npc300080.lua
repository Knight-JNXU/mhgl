Preload("Quest50008.lua")
Npc300080 = {							   -- 武考官
	npc_id = 300080,						-- NPC ID
	name = GetNpcName(300080),				-- NPC 名称
}

function Npc300080:Talk(bProcess)
  NpcAsk("现在讲求和平时代,打打杀杀的已经被唐王禁止了,少侠还是去参加文试吧")
	SetAnswer(1,"离开")
	WaitAnswer(1)
end
--[[
  local flag = player:GetQuests():GetFlag(50008)
	local Flag = player:GetQuests():GetFlag(508)
	local Quest = player:GetQuests():GetQuest(50008) 
	
	if player:GetQuests():HasQuest(50006) and player:GetQuests():GetQuest(50006):GetTargetNpcId(1) == 300060 then
		NpcSay("少侠应该去建邺城找\#A1号文考官\#W开始会试。")
		return
	end
	if player:GetQuests():HasQuest(50008) and Quest:IsFailed() then 
		NpcSay("请去皇宫魏征处取消任务再次科举吧。")
		return
	end
    if flag == 13 and player:GetQuests():TimeMarkOver(50008, 300) == false then --活动进行时回复考官
		player:GetQuests():RemoveQuest(50008)
		Quest50008:Take()
	elseif flag > 13 and flag < 18 and player:GetQuests():TimeMarkOver(50008, 300) == false then --活动期间内抓同伴		
		Quest50008:PartnerReturn()	
	elseif Quest ~= nil and flag ~= 22 and flag ~= 12 then --有任务且任务非回复考官时
	    NpcAsk("事情都做完了吗？")
		if player:GetQuests():TimeMarkOver(50008, 300) == false then --活动进行时
			SetAnswer(1, "我要退出科举")
		end
		if player:GetQuests():TimeMarkOver(50008, 300) == true then --活动结束后
			SetAnswer(2, "删除任务")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
		  NpcAsk("退出本届科举大赛，只有下次才能继续参加，你考虑好了吗？")
			SetAnswer(1, "我考虑好了")
			SetAnswer(2, "我点错了")
			WaitAnswer(2)
			if GetAnswer() == 1 then
			    NpcSay("你退出了本次科举。")
				if bProcess then
				    player:GetQuests():RemoveQuest(50008)
					player:GetQuests():RemoveFlag(50008)
					player:GetQuests():SetFlag(508,4)
				end
			end
		elseif GetAnswer() == 2 then
			NpcSay("任务已删除。")
			if bProcess then
				player:GetQuests():RemoveQuest(50008)
				player:GetQuests():RemoveFlag(50008)
				player:GetQuests():SetFlag(508,0)
			end
		end
	elseif flag == 22 and player:GetQuests():TimeMarkOver(50008, 300) == false then --挑战完四将领
	    NpcSay("你顺利的完成了本次科举考试。")
		player:GetQuests():RemoveQuest(50008)
		player:GetQuests():SetFlag(50008,flag+1)		
		if player:GetQuests():TimeMarkOver(50008, 9) == false  then
			NpcSay("恭喜！由于你的出色表现，获得“谁与争锋”称谓。")
			player:AddTitle(403)
			player:ShowRumor(string.format("\#W%s\#O勇武过人，特赐予“谁与争锋”称谓以示褒奖，希望他百尺竿头更进一步。",player:GetName()),true)
			return
		end
		if player:GetQuests():TimeMarkOver(50008, 18) == false  then
			NpcSay("恭喜！由于你的出色表现，获得“骁勇善战”称谓。")
			player:AddTitle(404)
			player:ShowRumor(string.format("\#W%s\#O勇武过人，特赐予“骁勇善战”称谓以示褒奖，希望他百尺竿头更进一步。",player:GetName()),true)
			return
		end
		
    elseif Quest == nil then --任务为空
		NpcAsk("准备好开始武试了吗？")
		if player:GetQuests():TimeMarkOver(50008, 300) ~= false then --活动结束后或者未参加活动
			SetAnswer(1, "是的")
		end
		if player:GetQuests():TimeMarkOver(50008, 300) == false and flag == 23 or 
		   player:GetQuests():TimeMarkOver(50008, 300) == false and flag == 0 then --活动期间完成过至少一次任务或者退出过活动
			SetAnswer(2, "重新科举")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
			
		if GetAnswer() == 1 then
		    if player:GetLevel() < 30 then
			    NpcSay("低于30级不能参加科举。")
				return
			end
			if player:GetQuests():TimeMarkOver(50007, 300) == false or player:GetQuests():HasQuest(50007) then --参加过文试或者正在文试
				NpcSay("每次科举只能参加一个类型的考试。")
				return
			end
			local flag300090 = player:GetQuests():GetFlag(50006)
			if flag300090 == 1 and player:GetQuests():TimeMarkOver(50006, 300) == false then --活动期间内完成过乡试
			    if player:GetQuests():TimeMarkOver(50008, 300) == true then
				    player:GetQuests():RemoveTimeMark(50008)
				end
			    if bProcess then
					Quest50008:Take()
					player:GetQuests():SetFlag(508,1)
					player:GetQuests():RemoveQuest(50006)
					player:GetQuests():RemoveFlag(50008)
				end	
			else
				NpcSay("通过乡试以后才能参加会试。")
			end
		elseif GetAnswer() == 2 then
			NpcAsk("少侠若是对自己的成绩不满意可以报名重新科举。")
			SetAnswer(1, "我重新参加科举")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then 
				if Flag == 3 then
					NpcSay("你已参加了三次会试，请下次活动再来吧。")
					return
				elseif Flag == 4 then
					NpcSay("你已退出了本次科举，请下次活动再来吧。")
					return			
				end
				if bProcess then
					player:GetQuests():RemoveTimeMark(50008)
					player:GetQuests():SetFlag(508,Flag+1)
					player:GetQuests():RemoveFlag(50008)
					Quest50008:Take()
				end
			end
	    end		
	end
end
--]]
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300080)