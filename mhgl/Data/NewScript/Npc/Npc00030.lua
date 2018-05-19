
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00030 = {							-- 孙小红
	npc_id = 30,						-- NPC ID
	name = GetNpcName(30),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00030:Talk(bProcess)
  NpcAsk("我只为10级以下的新人治疗,而且是免费的。有什么可以帮你的吗？")
  SetAnswer(1,"请帮我治疗")
  SetAnswer(2,"我随便看看,打扰了")
  WaitAnswer(2)
  if GetAnswer() == 1 then
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
	--print("NPC Talk() End")
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end

function Npc00030:Rest(bProcess, character, bRest)
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
	end
end
		
		
		
		



-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00030)
