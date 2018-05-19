 -- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00694 = {							-- 孙小红
	npc_id = 694,						-- NPC ID
	name = GetNpcName(694),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00694:Talk(bProcess)
  NpcAskParty("远道而来幸苦了,我们酒店有干净舒适的客房,您休息后可完全回复气血和魔法,休息一次需要500两银子,并消耗10%的当前活力。对于20级以下的玩家,我们不收费,但是还要消耗10%的当前活力哦。")
  SetAnswer(1,"我要住店休息")
  SetAnswer(2,"我精神很好,不想住店")
  if party and party:GetRealMemNum() > 1 then
    WaitAnswer(4, 5)
		for i = 0, party:GetRealMemNum() - 1 do
			local ans = GetAnswer(i) 
			local member = party:GetInPartyMember(i)
			if member then
				print("member", i, ans)
				self:Rest(bProcess, member, (ans == 1))
			end
		end
	else
		WaitAnswer(4)					-- 等待答案
		self:Rest(bProcess, player, (GetAnswer() == 1))
	end
	print("NPC Talk() End")
end


 function Npc00694:Rest(bProcess, character, bRest)
	if not bRest then
		NpcSayTo(character, "那下次再回來休息吧！")
		return
	end
	if character:GetLevel() >= 10 and character:GetMoney() < 500 then
		NpcSayTo(character, "你身上的金钱不足500。")
		return
	end
	NpcSayTo(character, "经过休息，你觉得精力充沛")
	if bProcess then
		print("character rest", character:GetChar_id())
		if character:GetLevel() >= 10 then
			character:ChangeMoney(-500,1010)
		end
		character:SetFull(true, true, false, false)
	end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00694)
