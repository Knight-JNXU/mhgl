Preload("Quest63521.lua")
--唐门护法
Npc300504 = {npc_id = 300504, name = GetNpcName(300504)}
Npc300504.Talk = function(self, bProcess)
  local wDay = LuaI.GetRealWDay()
  local hour = LuaI.GetRealHour()
  local rDay = LuaI.GetRealHour()
  local rYear = LuaI.GetRealYear()
  local rMonth = LuaI.GetRealMonth()
	local q = player:GetQuests():GetQuest(63521) 
	local getTime = os.date("%d");
	NpcAsk("受皇帝之命,各大门派举行门派守护,江湖人士可进行闯关,胜利者可获得丰厚奖励！\r#P活动时间为每天晚间20:00-21:00\r#Y任务领取人:[长安门派闯关使者]")
  if hour >= 20 and hour < 21 then
	  SetAnswer(1, "挑战")
	end
  SetAnswer(3, "离开")
  WaitAnswer(3)
  if GetAnswer() == 1 then
		local quest63521 = player:GetQuests():GetQuest(63521)
		if player:GetLevel() < 40 then
			NpcSay("小朋友，还是练到\#G40\#W级再来挑战吧。")
			return false
		end
		if not quest63521 then
			NpcSay("请在戚继光处领取挑战任务，组上\#G5\#W人队伍，再根据任务提示逐一挑战。")
			return false
		end
    if q:GetTargetMobId(1) < 470 then
      NpcSayParty("你还没资格挑战我,快快离开！")
      return false
    end
		for i = 0, party:GetRealMemNum() - 1 do  
		  local member = party:GetInPartyMember(i)
		  local q = member:GetQuests():GetQuest(63521)
      if q and q:GetTargetMobId(1) > 470 then
	     	NpcSayParty(string.format("\#P%s\#W，你已经过关了，去挑战下一关吧！",member:GetName()))
			  return false
		  end
		end
		for i = 0, party:GetRealMemNum() - 1 do  
		  local member = party:GetInPartyMember(i)
		  local q = member:GetQuests():GetQuest(63521)
		  if member then		
		    if not q then
					NpcSayParty(string.format("\#P%s\#W身上没有挑战任务，请去戚继光处领取。", member:GetName()))
					return false
				elseif q and q:IsFailed() then
					NpcSayParty(string.format("\#P%s\#W的挑战任务已失败，请删除。", member:GetName()))
					return false
				elseif q and q:GetTargetNpcId(1) < npc:GetNpc_id() then
					NpcSayParty(string.format("\#P%s\#W，你还不够资格挑战我！",member:GetName()))
					return false
				elseif q and q:GetTargetNpcId(1) > npc:GetNpc_id() then
					NpcSayParty(string.format("\#P%s\#W，你已经过关了，去挑战下一关吧！",member:GetName()))
					return false
			  end
			end
	  end
	  if IsProcess() then 
		  script:SetSaying(true)
      player:EncounterBattle(300504)
    end
  end
end
--[[		if not party or party:GetRealMemNum() < 1 then
			NpcSay("没有\#G5\#W个人，我是不会出手的！")
			return false
		end
    for i = 0, party:GetRealMemNum() - 1 do
    local member = party:GetInPartyMember(i)
      if member then
        if not q then
          NpcSayParty(string.format("\#P%s\#W身上没有门派闯关任务，请去戚继光处领取。", member:GetName()))
          return false
        end
        if q:GetTargetMobId(1) < 5025 then
          NpcSayParty("你还没资格挑战我,快快离开！")
          return false
        end
        if q and q:IsFailed() then 
          NpcSayParty(string.format("\#P%s\#W的挑战任务已失败，请删除。", member:GetName()))
          return false
        end
        if q and q:GetTargetMobId(1) > 5025 then
					NpcSayParty(string.format("\#P%s\#W，你已经过关了，去挑战下一关吧！",member:GetName()))
					return false
				end
        for i = 0, party:GetRealMemNum() - 1 do
          local member = party:GetInPartyMember(i)
          local q = member:GetQuests():GetQuest(63521)
          if member then
            q:FindTargetNPC(1)
            q:UpdateData()
          end
        end--]]
          
        


  
    

  

AddNpcTable(Npc300504)

--乾坤袋系统已经自动发送，请注意查收！