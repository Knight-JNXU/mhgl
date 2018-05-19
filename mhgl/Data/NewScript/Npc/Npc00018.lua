-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00018 = {							-- 孙小红
	npc_id = 18,						-- NPC ID
	name = GetNpcName(18),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00018:Talk(bProcess)
  NpcAskParty("我是专门治疗和调训召唤兽的医生,10级以下免费治疗驯养。选择驯养或治疗前请注意,我每次都是把你身上携带所有召唤兽进行统一治疗和驯养。")
  SetAnswer(1,"我要同时补满召唤兽的气血、魔法和忠诚值")
  SetAnswer(2,"我只看看")
  if party and party:GetRealMemNum() > 1 then
    WaitAnswer(4, 5)
		for i = 0, party:GetRealMemNum() - 1 do
			local ans = GetAnswer(i) 
			local member = party:GetInPartyMember(i)
			if member then
				--print("member", i, ans)
				self:Rest(bProcess, member, (ans == 1))
			end
		end
	else
		WaitAnswer(4)					-- 等待答案
		self:Rest(bProcess, player, (GetAnswer() == 1))
	end
	--print("NPC Talk() End")
end
 function Npc00018:Rest(bProcess, character, bRest)
	local lv = player:GetLevel() 
	local A = lv*3.145*lv
	local money = math.floor(A)
	if not bRest then
		NpcSayTo(character, "那下次再回來休息吧！")
		return
	end
	if character:GetLevel() >= 10 and character:GetMoney() < money then
	--	NpcSayTo(character, "你身上的金钱不足200。")
		NpcSayTo(character,string.format("你身上的银两不足%s",money))
		return
	end
	
	NpcSayTo(character, "经过休息，你和你的参战同伴都觉得精力充沛……同伴对你的好感度也有所增加……")
	if bProcess then
		--print("character rest", character:GetChar_id())
		if character:GetLevel() >= 10 then
			character:ChangeMoney(-money,1010)
		end
		character:SetFull(true, true, false, false)
		character:GetPartners():SetAllFull(true, true, true)
	end
end

--..RandomLine(10)
function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00018)
