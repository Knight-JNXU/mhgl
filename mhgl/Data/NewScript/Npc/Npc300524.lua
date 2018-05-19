Npc300524 = {							-- 天蚕教
	npc_id = 300524,						-- NPC ID
	name = GetNpcName(300524),				-- NPC 名称
}

function Npc300524:Talk(bProcess)
  NpcAsk("嘿嘿,要不要来切磋一把?要是能赢我,我就送你们一样宝贝。")
	SetAnswer(1, "我准备好了。")
	SetAnswer(2, "我们才不稀罕你宝贝呢!拜拜!")
	WaitAnswer(2)
    if GetAnswer() == 1 then
	    if party == nil or party:GetRealMemNum() < 5  then
			NpcSayParty("（与我过招比较危险，至少需要\#G5\#W人组队挑战。）")
		else
		    if party:GetInPartyMember(0):GetLevel() < 105 then
				NpcSayParty({"小朋友，想和我过招好歹也练到105级再来吧。"
						})
				return false
			end
   			for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
				if member then
				    if member:GetLevel() < 105 then
					NpcSayParty({"小朋友，想和我过招好歹也练到105级再来吧。"
						})
						return false
					end
				end
			end
      local lvmin = player:GetLevel()
      local lvmax = player:GetLevel()
      for i = 0, party:GetCount() - 1 do
        local member = party:GetMember(i)
        if member then
          local lv = member:GetLevel()
          if lv < lvmin then
            lvmin = lv
          elseif lvmax < lv then
            lvmax = lv
          end
          if lvmax - lvmin > 10 then --（队员之间等级不能超相差10级）
            NpcSayParty("队员之间等级不能相差10级")
            return false
          end
        end
      end
			if npc and npc:GetEnableBattle() then
				if bProcess then
					player:EncounterBattle(self.npc_id)
					if npc then
						npc:SetEnableBattle(false)
					end
				end
			else
				NpcAskParty("没看我正忙着吗，打架也要排队的！")
				SetAnswer(1,"离开")
				WaitAnswer(1)
			end
		end
  end
end

AddNpcTable(Npc300524)
