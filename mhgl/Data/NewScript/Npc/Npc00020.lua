Preload("Quest10004.lua")
Preload("Quest10005.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Preload("Quest55002.lua")
Npc00020 = {							
	npc_id = 20,					
	name = GetNpcName(20),	
	quests = { Quest10004,Quest10005}	
}


function Npc00020:Talk(bProcess)
  --print("NPC Talk() Start")
	local quest30605 = player:GetQuests():GetQuest(30605) 
	local quest30606 = player:GetQuests():GetQuest(30606)
	local quest30607 = player:GetQuests():GetQuest(30607)
	local quest30608 = player:GetQuests():GetQuest(30608)
	local quest55002 = player:GetQuests():GetQuest(55002)
	local quest_ids = {10004,10005}
	NpcAsk("我是这里有名的郎中,你受伤了吗？我帮你医治吧。")
		if HasQuest(quest_ids) then
			SetAnswer(1, "主线任务")
		end
		if HasQuest(55002) and quest55002:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(2, "发展任务")
		end
		if (HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id) or 
		(HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id) then
			SetAnswer(4, "镖局任务")
		end
		SetAnswer(5,"好的,快些救治我吧。")
		SetAnswer(6, "算了,我还健康的很。")
		WaitAnswer(6)
		if GetAnswer() == 1 then
			if HasQuest(10004) then
				if Quest10004:Return() then
					Quest10005:Take()
				end
			elseif HasQuest(10005) then
				Quest10005:Return()
			end
	elseif GetAnswer() == 2 then
			Quest55002:Return()	
	elseif GetAnswer() == 4 then	
		if HasQuest(30605) and quest30605:GetTargetNpcId(1) == self.npc_id then
			Quest30605:ReturnFirst()
		elseif HasQuest(30606) and quest30606:GetTargetNpcId(1) == self.npc_id then
			Quest30606:ReturnFirst()
		elseif HasQuest(30607) and quest30607:GetTargetNpcId(1) == self.npc_id then
			Quest30607:ReturnFirst()
		elseif HasQuest(30608) and quest30608:GetTargetNpcId(1) == self.npc_id then	
			Quest30608:ReturnFirst()
		end
	elseif GetAnswer() == 5 then
		NpcAskParty("你真的需要休息嗎？")	-- 向所有队员发問
		SetAnswer(1, "是")
		SetAnswer(2, "否")
		if party and party:GetRealMemNum() > 1 then
			WaitAnswer(2, 5)				-- 等待答案，设有時限
			for i = 0, party:GetRealMemNum() - 1 do
				local ans = GetAnswer(i) 
				local member = party:GetInPartyMember(i)
				if member then
					--print("member", i, ans)
					self:Rest(bProcess, member, (ans == 1))
				end
			end
		else
			WaitAnswer(2)					-- 等待答案
			self:Rest(bProcess, player, (GetAnswer() == 1))
		end
	end
	--print("NPC Talk() End")
end
		
function Npc00020:Rest(bProcess, character, bRest)
	if player:GetLevel()  >= 10 then
	  NpcSay("我只能医治10级以下的新人")
	  return
  end 
	if not bRest then
		NpcSayTo(character, "那下次再回來休息吧！")
		return
	end
	if character:GetLevel() >= 10 and character:GetMoney() < 200 then
		NpcSayTo(character, "你身上的金钱不足200。")
		return
	end
	
	NpcSayTo(character, "经过休息，你觉得精力充沛")
	
	if bProcess then
		--print("character rest", character:GetChar_id())
		if character:GetLevel() >= 10 then
			character:ChangeMoney(-200,1010)
		end
		character:SetFull(true, true, false, false)
	--	character:GetPartners():SetAllFull(true, true, true)
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
AddNpcTable(Npc00020)
