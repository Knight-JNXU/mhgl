Preload("Quest63532.lua")
--十二连环坞护法
Npc00200002 = {npc_id = 00200002, name = GetNpcName(00200002)}
Npc00200002.Talk = function(self, bProcess)
	local q = player:GetQuests():GetQuest(63532) 
	NpcAsk("\r#P挑战我才可以转生")
	SetAnswer(1, "挑战")
  SetAnswer(3, "离开")
  WaitAnswer(3)
  if GetAnswer() == 1 then
		local quest63532 = player:GetQuests():GetQuest(63532)
		if player:GetLevel() < 40 then
			NpcSay("小朋友，还是练到\#G40\#W级再来挑战吧。")
			return false
		end
		if not quest63532 then
			NpcSay("请在戚继光处领取挑战任务，组上\#G5\#W人队伍，再根据任务提示逐一挑战。")
			return false
		end
    if q:GetTargetMobId(1) < 00200002 then
      NpcSayParty("你还没资格挑战我,快快离开！")
      return false
    end
		for i = 0, party:GetRealMemNum() - 1 do  
		  local member = party:GetInPartyMember(i)
		  local q = member:GetQuests():GetQuest(63532)
      if q and q:GetTargetMobId(1) > 00200002 then
	     	NpcSayParty(string.format("\#P%s\#W，你已经过关了，去挑战下一关吧！",member:GetName()))
			  return false
		  end
		end
		for i = 0, party:GetRealMemNum() - 1 do  
		  local member = party:GetInPartyMember(i)
		  local q = member:GetQuests():GetQuest(63532)
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
      player:EncounterBattle(00200002)
    end
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end
--..RandomLine(10)
function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
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
          local q = member:GetQuests():GetQuest(63532)
          if member then
            q:FindTargetNPC(1)
            q:UpdateData()
          end
        end--]]
          
        


  
    

  

AddNpcTable(Npc00200002)

--乾坤袋系统已经自动发送，请注意查收！